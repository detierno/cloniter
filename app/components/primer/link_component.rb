# frozen_string_literal: true

module Primer
  class LinkComponent < ViewComponent::Base
    def initialize(href:, opts:)
      super

      @href = href
      @opts = opts
    end

    private

    class Danger < LinkComponent; end
  end
end
