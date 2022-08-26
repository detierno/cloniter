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
      'p-4 mb-4 text-sm text-primary-700 bg-primary-100 rounded-lg dark:bg-primary-200 dark:text-primary-800'
    end
  end

  class Alert < AlertComponent
    def css
      'p-4 mb-4 text-sm text-alert-700 bg-alert-100 rounded-lg dark:bg-alert-200 dark:text-alert-800'
    end
  end
end
