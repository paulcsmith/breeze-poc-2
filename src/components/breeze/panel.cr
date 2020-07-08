class Breeze::Panel < BaseComponent
  def render
    div class: "bg-white border border-gray-200 overflow-hidden sm:rounded-md" do
      yield
    end
  end
end
