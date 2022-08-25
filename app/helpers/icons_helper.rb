# frozen_string_literal: true

module IconsHelper
  FEED_SHAPE = <<~ICON.squish
    M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0#{' '}
    01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1#{' '}
    1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4'
  ICON

  USERS_SHAPE = <<~ICON.squish
    M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6#{' '}
    6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z
  ICON

  SPEECH_SHAPE = <<~ICON.squish
    M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z
  ICON

  SHAPES = {
    feed: FEED_SHAPE,
    users: USERS_SHAPE,
    speech: SPEECH_SHAPE
  }.freeze

  def icon_tag(icon)
    tag.svg class: 'w-5 h-5', fill: 'none', stroke: 'currentColor', 'viewBox' => '0 0 24 24',
            xmlns: 'http://www.w3.org/2000/svg' do
      tag.path 'stroke-linecap' => 'round',
               'stroke-linejoin' => 'round',
               'stroke-width' => '2',
               d: SHAPES[icon]
    end
  end
end
