# frozen_string_literal: true

module Primer
  class ModalComponent < ViewComponent::Base
    def initialize(name:)
      super

      @name = name
    end
  end
end
