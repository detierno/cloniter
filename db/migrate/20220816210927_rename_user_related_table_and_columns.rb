# frozen_string_literal: true

class RenameUserRelatedTableAndColumns < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :accounts
    rename_column :tweets, :user_id, :account_id
  end
end
