# frozen_string_literal: true

class NavComponent < ViewComponent::Base
  renders_many :sections, 'SectionComponent'

  def initialize(account:)
    super
  end

  class SectionComponent < ViewComponent::Base
    renders_many :links, 'LinkComponent'
    renders_many :buttons, 'ButtonComponent'

    def initialize(name:, links: [], buttons: [])
      super

      @name = name
      @links = links
      @buttons = buttons
    end
  end

  class LinkComponent < ViewComponent::Base
    include IconsHelper

    def initialize(name:, link:, icon: nil, opts: {})
      super

      @name = name
      @link = link
      @icon = icon
      @opts = opts
    end
  end

  class ButtonComponent < ViewComponent::Base
    include IconsHelper

    def initialize(name:, link:, icon: nil, opts: {})
      super

      @name = name
      @link = link
      @icon = icon
      @opts = opts
    end
  end
end
