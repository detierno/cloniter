# frozen_string_literal: true

module Accounts
  class AvatarComponent < ViewComponent::Base
    def initialize(account:)
      super

      @account = account
    end

    def call
      image_tag avatar_image, class: 'w-8 h-8 rounded-full'
    end

    private

    def avatar_image
      img = @account.avatar
      img.attached? ? img.variant(:thumb) : 'accounts/no-image'
    end
  end
end
