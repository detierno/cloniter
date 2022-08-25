# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(message:, color:)
    super

    @message = message
    @color = color
  end

  def render?
    @message.present?
  end
end
