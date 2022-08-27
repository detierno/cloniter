# frozen_string_literal: true

module Sidebars
  class NavComponent < ViewComponent::Base
    renders_many :sections, 'SectionComponent'

    class SectionComponent < ViewComponent::Base
      # not working in nested components
      # renders_many :links, 'LinkComponent'
      # renders_many :buttons, 'ButtonComponent'

      def initialize(name:, links: [], buttons: [])
        super

        @name = name
        @links = links
        @buttons = buttons
      end
    end

    class LinkComponent < ViewComponent::Base
      def initialize(name:, link:, icon: nil, opts: {})
        super

        @name = name
        @link = link
        @icon = icon
        @opts = opts
      end
    end

    class ButtonComponent < ViewComponent::Base
      def initialize(name:, link:, icon: nil, opts: {})
        super

        @name = name
        @link = link
        @icon = icon
        @opts = opts
      end
    end
  end
end
