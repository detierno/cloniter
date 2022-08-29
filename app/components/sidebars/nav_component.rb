# frozen_string_literal: true

module Sidebars
  class NavComponent < ViewComponent::Base
    renders_many :sections, 'SectionComponent'

    class SectionComponent < ViewComponent::Base
      renders_many :links, 'Sidebars::NavComponent::LinkComponent'
      renders_many :buttons, 'Sidebars::NavComponent::ButtonComponent'
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
