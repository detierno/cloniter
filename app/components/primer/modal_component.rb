# frozen_string_literal: true

class Primer::ModalComponent < ViewComponent::Base
  def initialize(name:)
    @name = name
  end
end
