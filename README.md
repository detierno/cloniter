# Cloniter

This is a Twitter clone for study purposes. It's a proof of concept on how
to structure a rails project with minimal dependencies and set up for fast development
and healthy and scalable growth.

## Stack choice
Plain old boring rails 7 with Postgresql with turbo and stimulus for
frontend SPA behavior and user experience enhancement. Tailwind CSS for
no css at all and ViewComponent to replace rails partials.

## Patterns

**Checks pattern**
Based on the [checks pattern](http://c2.com/ppr/checks.html) implement the WholeValue
pattern (lives inside `app/values`) to separate user input data from object modeling.

**No primitive obsession**
Still based on the pattern above avoid using default ruby types like strings to
represent meaningful domain models. Example, in the `Tweet` model the content
is not represented by a string. Instead is represented by its own class
```ruby
Tweet.new(content: 'Hello there')
=> #<Tweet:0x00007fef793705f8
     id: nil,
     content: TweetContent(Hello there)>
```

**No special case**

**No cumbersome User**

**Object orientated messages with no long chains**

**Components**

## Setup
- Requirements
Install Postgresql for db and libvips (or imagemagick) for image processing.

- Configure the application
```
./bin/setup
```

- Run local services
```
./bin/dev
```

## Running tests

- Run an individual test with
```
rails test test/path/to/test_file
```

- Run the full suit
```
railst test:all
```
