# frozen_string_literal: true

module Primer
  class LinkComponent < ViewComponent::Base
    def initialize(href:, scheme:, opts:)
      super

      @href = href
      @scheme = scheme
      @opts = opts
    end

    private

    def options
      @opts.inject('') do |options, (key, values)|
        options + ("#{key}-" + values.inject('') { |opts, (k, value)| opts + "#{k.to_s.gsub('_', '-')}=#{value}" })
      end
    end

    def color
      case @scheme
      when :default then 'blue'
      when :danger then 'red'
      else
        'purple'
      end
    end
  end
end
