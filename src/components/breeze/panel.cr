class Breeze::Panel < BaseComponent
  def render
    div class: "mb-10 bg-white rounded-lg shadow-lg overflow-hidden" do
      yield
    end
  end
end
