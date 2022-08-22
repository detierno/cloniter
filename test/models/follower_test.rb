# frozen_string_literal: true

require 'test_helper'

class FollowerTest < ActiveSupport::TestCase
  setup do
    @jon = create(:jon_account)
    @samsa = create(:samsa_account)
  end

  test '.subscribe increase record count by 1' do
    assert_difference -> { @jon.subscribed_accounts.count }, 1 do
      @jon.subscribed_accounts.subscribe(@samsa)
    end
  end

  test '.follows? returns true for existing record' do
    @jon.subscribed_accounts.subscribe(@samsa)
    assert @jon.follows?(@samsa)
  end

  test '.follows? returns false for non existing record' do
    assert_not @jon.follows?(@samsa)
  end

  test '.unsubscribe reduce record count by 1' do
    @jon.subscribed_accounts.subscribe(@samsa)

    assert_difference -> { @jon.subscribed_accounts.count }, -1 do
      @jon.subscribed_accounts.unsubscribe(@samsa)
    end
  end
end
