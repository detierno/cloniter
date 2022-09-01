# frozen_string_literal: true

class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :account, null: false, foreign_key: true
      t.references :subscriber, null: false, foreign_key: { to_table: :accounts }

      t.timestamps
    end

    add_index :followers, %i[account_id subscriber_id], unique: true
  end
end
