# frozen_string_literal: true

class NavComponent < ViewComponent::Base
  renders_many :links, 'LinkComponent'

  def initialize(title:)
    super

    @title = title
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
end
