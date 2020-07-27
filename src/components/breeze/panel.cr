class Breeze::Panel < BaseComponent
  def render
    div class: "bg-white rounded-lg shadow-lg overflow-hidden" do
      yield
    end
  end
end
