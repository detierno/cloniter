# frozen_string_literal: true

jon = Account.create!(name: 'Jon Snow', username: 'jon_snow', password: 'secret')
jon.avatar.attach(io: File.open(Rails.root.join('db/seeds/jon.png')), filename: 'jon.png')

samsa = Account.create!(name: 'Samsa stark', username: 'samsa_stark', password: 'secret')
samsa.avatar.attach(io: File.open(Rails.root.join('db/seeds/samsa.png')), filename: 'samsa.png')

jaime = Account.create!(name: 'Jaime Lannister', username: 'jaime_lannister', password: 'secret')
jaime.avatar.attach(io: File.open(Rails.root.join('db/seeds/jaime.png')), filename: 'jaime.png')

jon.follow(samsa)

samsa.follow(jon)
samsa.follow(jaime)

jaime.follow(samsa)
jaime.follow(jon)

samsa.build_tweet(content: 'Hello Westeros').publish
jon.build_tweet(content: 'I know nothing').publish
jaime.build_tweet(content: 'Cersei is so cute...').publish
