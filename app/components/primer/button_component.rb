# frozen_string_literal: true

module Primer
  class ButtonComponent < ViewComponent::Base
    def initialize(scheme: :default, type: :button)
      super

      @scheme = scheme
      @type = type
    end

    private

    def color
      case @scheme
      when :default then 'blue'
      else
        'purple'
      end
    end
  end
end
