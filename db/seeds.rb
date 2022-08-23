# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
['Jon Snow', 'Samsa Stark', 'Jaime Lannister'].each do |name|
  Account.create!(
    name: name,
    username: name.parameterize(separator: '_'),
    password: 'secret'
  )
end
