# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(message:)
    super

    @message = message
  end

  def call
    tag.div(class: css, role: 'alert') { @message } if @message.present?
  end

  class Info < AlertComponent
    def css
      "p-4 mb-4 text-sm text-blue-700 bg-blue-100 rounded-lg dark:bg-blue-200 dark:text-blue-800"
    end
  end

  class Alert < AlertComponent
    def css
      "p-4 mb-4 text-sm text-yellow-700 bg-yellow-100 rounded-lg dark:bg-yellow-200 dark:text-yellow-800"
    end
  end
end
