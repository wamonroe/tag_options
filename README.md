# Tag Options

Simple library for manipulating options passed to the Rails `tag`, `content_tag`, and other tag helpers.

This library provides a simple class to make authoring resuable helpers and [View Components](https://viewcomponent.org)
easier when you want to allow for the input of attributes on HTML elements, but also need to add/set your own.

`TagOptions::Hash` is an object that normalizes the options passed to Rails helper, while providing helpful methods
to manipulate the values of HTML attributes:

```ruby
def external_link_to(name, url, options={})
  options = TagOptions::Hash.new(options)
  options.combine_with_class!('external-link')
  link_to(name, url, options)
end
```

Called with:

```ruby
external_link_to('Example', 'https://example.com', class: 'ml-2')
```

Would render:

```html
<a href="https://example.com" class="ml-2 external-link">Example</a>
```

## Table of Contents

- [Installation](#installation)
- [Configuration](#configuration)
- [General Usage](#general-usage)
  - [combine_with!](#combinewith)
  - [override!](#override)
- [Conditional Usage](#conditional-usage)
- [Development](#development)
- [Contributing](#contributing)
- [To Do](#to-do)
- [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tag_options'
```

And then execute:

```sh
bundle install
```

## Configuration

Generate an initializer to customize the default configuration:

```sh
rails generate arc_options:install
```

## General Usage

Initialize a `TagOptions::Hash` directly or by passing an existing `Hash`.

```ruby
TagOptions::Hash.new
=> {}

hash = {class: 'flex'}
TagOptions::Hash.new(hash)
=> {:class=>"flex"}
```

### combine_with!

Combine HTML attributes with an existing `TagOptions::Hash` using `combine_with!`

```ruby
options = TagOptions::Hash.new(class: 'flex')
options.combine_with!(class: 'mt-1')
=> {:class=>"flex mt-1"}
```

Values can also be specified as arrays.

```ruby
options = TagOptions::Hash.new(class: 'flex')
options.combine_with!(class: ['mt-1', 'mx-2'])
=> {:class=>"flex mt-1 mx-2"}
```

HTML attributes are only added if they don't already exist.

```ruby
options = TagOptions::Hash.new(class: 'flex')
options.combine_with!(class: 'flex flex-col')
=> {:class=>"flex flex-col"}
```

You can also combine multiple HTML attributes in one operation.

```ruby
options = TagOptions::Hash.new(class: 'flex')
options.combine_with!(class: 'mt-1', 'data-controller': 'dropdown')
=> {:class=>"flex mt-1", :"data-controller"=>"dropdown"}
```

Dash seperated HTML attributes, such as `data-controller` can also be specified as nested hashes.

```ruby
options = TagOptions::Hash.new(class: 'flex')
options.combine_with!(class: 'mt-1', data: { controller: 'dropdown' })
=> {:class=>"flex mt-1", :"data-controller"=>"dropdown"}
```

Dash seperated HTML attributes can also be specified using underscores.

```ruby
options = TagOptions::Hash.new(class: 'flex')
options.combine_with!(class: 'mt-1', data_controller: 'dropdown')
=> {:class=>"flex mt-1", :"data-controller"=>"dropdown"}
```

For ease of use, you can also combine values into a single HTML attribute using `combine_with_<attribute>!`, where
`<attribute>` is the name of the HTML attribute. Dash seperated HTML attributes should be specified using underscores.

```ruby
options = TagOptions::Hash.new(class: 'flex')
options.combine_with_class! 'mt-1'
options.combine_with_data_controller! 'dropdown'
=> {:class=>"flex mt-1", :"data-controller"=>"dropdown"}
```

### override!

The method `override!` functions nearly the same as `combine_with!` with all same usage patterns, including ease of
use methods, such as `override_class!`. The major difference is that the override methods will not combine specified
values with existing values. Any specified values will override any existing values.

## Conditional Usage

Both the `combine_with!` and `override!` allow for values to be conditionally added to HTML attributes using an argument
array. Where the values are added unconditionally and key/value pairs have their key added _IF_ the value is true.

```ruby
# assuming `centered?` returns `true`
options = TagOptions::Hash.new(class: 'flex')
options.combine_with!(class: ['mt-1', 'mx-auto': centered?, 'mx-2': !centered?])
=> {:class=>"flex mt-1 mx-auto"}
```

The syntax of the `combine_with_<attribute>!` and `override_<attribute>!` ease of use method allow for values and
conditional values to be combined more naturally using a more typical argument pattern.

```ruby
# assuming `centered?` returns `true`
options = TagOptions::Hash.new(class: 'flex')
options.combine_with_class!('mt-1', 'mx-auto': centered?, 'mx-2': !centered?)
=> {:class=>"flex mt-1 mx-auto"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/test` to run the tests. You can
also run:

- `bin/console` for an interactive prompt that will allow you to experiment
- `bin/rubocop` to run RuboCop to check the code style and formatting

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wamonroe/tag_options.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
