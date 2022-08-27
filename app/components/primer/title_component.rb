# frozen_string_literal: true

module Primer
  class TitleComponent < ViewComponent::Base
    def initialize(title:)
      super

      @title = title
    end

    def call
      tag.h1(class: 'text-3xl font-bold underline mb-5') { @title }
    end
  end
end
