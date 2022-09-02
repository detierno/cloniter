# Cloniter

This is a Twitter clone for study purposes. It's a proof of concept on how
to structure a rails project with minimal dependencies and set up for fast development
and healthy and scalable growth.

## Stack choice
Plain old boring rails 7 with Postgresql with turbo and stimulus for
frontend SPA behavior and user experience enhancement. Tailwind CSS for
no css at all and ViewComponent to replace rails partials.

## Premises

### Checks pattern
Based on the [checks pattern](http://c2.com/ppr/checks.html) implement the WholeValue
pattern (lives inside `app/values`) to separate user input data from object modeling.

### No primitive obsession

Still based on the pattern above avoid using default ruby types like strings to
represent meaningful domain models. Example, in the `Tweet` model the content
is not represented by a string. Instead is represented by its own class

```ruby
Tweet.new(content: 'Hello there')
=> <Tweet:0x00007fef793705f8, content: TweetContent(Hello there)>
```

### No special case
No checks for `current_user` exemplify it.

### No cumbersome User
User god models are a misrepresentation of how users actually
interacts with the system.

### Object orientated messages with no long chains
No `ActiveRecord` chains scattered in models/controllers. See [this article](OO_MESSAGES.md) for a detailed example.

### Components
Make rails view layer more sane (In probation yet)

## Setup
- Requirements
Install Postgresql for db and libvips (or imagemagick) for image processing.

- Configure the application
```
./bin/setup
```

- Run local services
```
# Install foreman (just needed once)
gem install foreman

# Run the services
./bin/dev
```

## Nice things to play
- Editing profile fields should reflect instantly on the sidebar;
- Posting/Liking a tweet will update followers feeds on the fly;



https://user-images.githubusercontent.com/65082/188007305-889c0804-27a4-4215-85a0-0f9bee13832a.mov



## Running tests

- Run an individual test with
```
rails test test/path/to/test_file
```

- Run the full suit
```
rails test:all
```
