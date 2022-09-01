# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :account, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, %i[account_id tweet_id], unique: true

    add_column :tweets, :likes_count, :integer
  end
end
