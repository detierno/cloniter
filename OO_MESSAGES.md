Let's talk about a common mistake in rails apps, using an example. Imagine you are implementing your own Tweeter in rails and you have to notify subscribers from an account that a tweet was published. Simplest implementation can look like that:
```ruby
# tweets_controller.rb
class TweetsController
	def create
	  @tweet = @account.build_tweet(tweet_params)
		@tweet.publish
	end
end

# models/account.rb
class Account
	has_many :subscribers
	has_many :tweets
end

# models/tweet.rb
class Tweet
	belongs_to :account

	def publish
		save.tap { |saved| broadcast_tweet_published if saved }
	end

	private

	def broadcast_tweet_published
		account.subscribers.each { |sub| TweetBroadcast.notify(sub, self) }
	end
end
```

Every good class should be followed by some unit tests, so let's implement it. As publish calls `ActiveRecord#save` there is no need to test the built in persistence, the real juice is to ensure our subscribers are being notified.
```ruby
class TweetTest < ActiveSupport::TestCase
	def setup
		@tweet = Tweet.new(content: 'Hello there')
	end

	test 'notify subscribers on tweet published' do
		subscriber1 = mock('Subscriber')
		subscriber2 = mock('Subscriber')
		account = mock('Account')

		account.stubs(:subscribers).returns([subscriber1, subscriber2])
		@tweet.stubs(:account).returns(account)

		TweetBroadcast.expects(:notify).with(@tweet, subscriber1)
		TweetBroadcast.expects(:notify).with(@tweet, subscriber2)

		@tweet.publish
	end
end
```

Test pass but there is a smell in the air, if you didn't figure out go back and take one more shot.
Our test case has a mock for the account and also mocks subscribers, implemented inside the `Account` model.There is a clear coupling between both models and an offense to one of the principles of object orientation. Alan Kay once described the OOP essence as:
> OOP to me means only messaging, local retention and protection and hiding of state-process, and extreme late-binding of all things.

In our example, the important part is: "only messaging" which we can put a mental model to help us to understand. In our current implementation this is what we got:
- An account has a new tweet
- Tweet is published
- Tweet please notify the account subscribers

The problem is that is no responsibility of the tweet to notify the account subscribers, this is an account's responsibility. Let's rewrite the mental model of the transaction to clarify:
- An account has a new tweet
- Tweet is published
- Account notify your subscribers about your tweet

The difference is subtle, but definitely aligns better with the idea of messaging proposed by Kay. Now, let's see how code looks like with our new mental model:
```ruby
# models/tweet.rb
class Tweet
	belongs_to :account

	def publish
		save.tap { |saved| account.on_tweet_published(self) if saved }
	end
end
```

Tweet class looks way cleaner, and even better, no coupling with `account.subscribers` anymore. Now the only responsibility of our `publish` method is to notify the account when a tweet is published and the `Account` can decide what to do with that information (including doing nothing).

Let's see the our tests now.
```ruby
class TweetTest < ActiveSupport::TestCase
  test 'publish call on_tweet_published when saved' do
    tweet = Tweet.new(content: 'Hello there')
    account = tweet.account

    account.expects(:on_tweet_published).with(tweet).once
    tweet.publish
  end

  test 'publish do not call on_tweet_published when not saved' do
    tweet = Tweet.new
    account = tweet.account

    account.expects(:on_tweet_published).never
    tweet.publish
  end
end
```

Tweet test is simpler now, what (in most cases) indicates good code, but how about the `on_tweet_published`. Well, I guess you can imagine, but we just need to move the chopped code from above to the `Account` model.
```ruby
# models/account.rb
class Account
	has_many :subscribers
	has_many :tweets

	def on_tweet_published(tweet)
		subscribers.each { |sub| TweetBroadcast.notify(sub, tweet) }
	end
end
```

```ruby
class AccountTest < ActiveSupport::TestCase
	def setup
		@account = Account.new
	end

	test 'notify subscribers on tweet published' do
		tweet       = mock('Tweet')
		subscriber1 = mock('Subscriber')
		subscriber2 = mock('Subscriber')

		@account.stubs(:subscribers).returns([subscriber1, subscriber2])

		TweetBroadcast.expects(:notify).with(tweet, subscriber1)
		TweetBroadcast.expects(:notify).with(tweet, subscriber2)

		@account.on_tweet_published(tweet)
	end
end
```
As you can see the implementation got simplified both for the method and the test. In my experience, this kind of design, respecting the OO principles, leads to an easy to maintain and healthier codebase.
