class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def content
    h1 "Sign Up"
    render_sign_up_form(@operation)
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create do
      sign_up_fields(op)
      submit "Sign Up", flow_id: "sign-up-button"
    end
    link "Sign in instead", to: SignIns::New
  end

  private def sign_up_fields(op)
    m Shared::Field, op.email, &.email_input(autofocus: "true")
    m Shared::Field, op.password, &.password_input
    m Shared::Field, op.password_confirmation, &.password_input
  end
end
