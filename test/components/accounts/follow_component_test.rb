# frozen_string_literal: true

require 'test_helper'

module Accounts
  class FollowComponentTest < ViewComponent::TestCase
    test 'renders nothing when current_account follows account' do
      current_account = mock('Account', follows?: true)
      component = Accounts::FollowComponent.new(account: 'Foo', current_account:)

      assert_empty render_inline(component).to_html
    end

    test 'renders a form when current_account do not follows account' do
      account = mock('Account', id: 10)
      current_account = mock('Account', follows?: false)

      component = Accounts::FollowComponent.new(account:, current_account:)

      render_inline(component)

      assert_selector 'input[value="Follow"]'
    end
  end
end
