# Git URL Rewriter

A simple gem that will allow the rewriting of Cocoapods git dependency URLs just before they are downloaded. This can be useful if certain network access is blocked.

## Installation

Add this line to your application's Gemfile:

```ruby
source 'https://tumblrgems.ewr01.tumblr.net' do
  gem 'cocoapods-git_url_rewriter', '1.0.0'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cocoapods-git_url_rewriter

## Usage

Intended usage of this Cocoapods plugin is as follows. It it designed to be used as an inline declaration with your projects Podfile.

```ruby
plugin 'cocoapods-git_url_rewriter', {
  "string literal to match against" => "replacement string literal"
}
```

A more concrete example would be as follows

```ruby
plugin 'cocoapods-git_url_rewriter', {
    'git@git.corp.yahoo.com:' => 'https://sekrittoken@git.corp.yahoo.com/'
}
```

## Contributing

1. Fork it ( https://github.ewr01.tumblr.net/brian/cocoapods-git_url_rewriter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
