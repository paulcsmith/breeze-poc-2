class Fiber
  property breeze_request : BreezeRequest?
end

module StoreBreeze
  macro included
    before store_breeze_request
    after store_breeze_response
  end

  def store_breeze_request
    req = BreezeRequest::SaveOperation.create!(
      path: request.resource,
      method: request.method,
      action: self.class.name,
      body: request.body.try(&.to_s),
      parsed_params: JSON.parse(params.to_h.to_json),
      session: JSON.parse(session.to_json),
      headers: JSON.parse(request.headers.to_h.to_json)
    )
    Log.dexter.debug { {debug_at: Breeze::Requests::Show.url(req.id)} }
    Fiber.current.breeze_request = req
    continue
  end

  def store_breeze_response
    req = Fiber.current.breeze_request.not_nil!
    BreezeResponse::SaveOperation.create!(
      breeze_request_id: req.id,
      status: response.status_code,
      session: JSON.parse(session.to_json),
      headers: JSON.parse(response.headers.to_h.to_json)
    )
    continue
  end
end
