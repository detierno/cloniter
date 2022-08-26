# frozen_string_literal: true

module Primer
  class ButtonComponent < ViewComponent::Base
    def initialize(scheme: :default, type: :button)
      super

      @scheme = scheme
      @type = type
    end

    class Primary < ButtonComponent; end
  end
end
