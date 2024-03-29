# frozen_string_literal: true

module Primer
  class IconComponent < ViewComponent::Base
    FEED_SHAPE = <<~ICON.squish
      M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0
      01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1
      1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4
    ICON

    USERS_SHAPE = <<~ICON.squish
      M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6
      6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z
    ICON

    SPEECH_SHAPE = <<~ICON.squish
      M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z
    ICON

    LOGOUT_SHAPE = <<~ICON.squish
      M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1
    ICON

    TASK_SHAPE = <<~ICON.squish
      M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9
      5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01
    ICON

    HEART_SHAPE = <<~ICON.squish
      M4.318 6.318a4.5 4.5 0 000 6.364L12
      20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z
    ICON

    SHAPES = {
      feed: FEED_SHAPE,
      users: USERS_SHAPE,
      speech: SPEECH_SHAPE,
      logout: LOGOUT_SHAPE,
      task: TASK_SHAPE,
      heart: HEART_SHAPE
    }.freeze

    def initialize(icon:)
      super

      @icon = icon
    end

    def call
      tag.svg class: 'w-5 h-5', fill: 'none', stroke: 'currentColor', 'viewBox' => '0 0 24 24',
              xmlns: 'http://www.w3.org/2000/svg' do
        tag.path 'stroke-linecap' => 'round',
                 'stroke-linejoin' => 'round',
                 'stroke-width' => '2',
                 d: SHAPES[@icon]
      end
    end
  end
end
