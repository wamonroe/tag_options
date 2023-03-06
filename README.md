# Tag Options

[![Test](https://github.com/wamonroe/tag_options/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/wamonroe/tag_options/actions/workflows/test.yml)

Simple library for manipulating options passed to the Rails `tag`,
`content_tag`, and other tag helpers.

This library provides a simple class to make authoring resuable helpers and
[View Components](https://viewcomponent.org) easier when you want to allow for
the input of properties on HTML elements, but also need to add/set your own.

`TagOptions::Hash` is an object that normalizes the options passed to Rails
helper, while providing helpful methods to manipulate the values of HTML
properties:

```ruby
def external_link_to(name, url, options={})
  options = TagOptions::Hash.new(options)
  options.at(:class).combine!("external-link")
  link_to(name, url, options)
end
```

Called with:

```ruby
external_link_to("Example", "https://example.com", class: "ml-2")
```

Would render:

```html
<a href="https://example.com" class="ml-2 external-link">Example</a>
```

## Table of Contents

- [Tag Options](#tag-options)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [General Usage](#general-usage)
    - [combine!](#combine)
    - [set!](#set)
    - [default!](#default)
    - [remove!](#remove)
  - [Conditional Usage](#conditional-usage)
  - [Custom Property Resolvers](#custom-property-resolvers)
  - [Development](#development)
  - [Contributing](#contributing)
  - [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "tag_options"
```

And then execute:

```sh
bundle install
```

## General Usage

Instantiate a `TagOptions::Hash` directly or by passing an existing `Hash`.

```ruby
TagOptions::Hash.new
=> {}

hash = {class: "flex"}
TagOptions::Hash.new(hash)
=> {:class=>"flex"}
```

Similar to `Array()`, you can also instantiate a new `TagOptions::Hash` by
passing a has to `TagOptions::Hash()`.

```ruby
hash = {class: "flex"}
TagOptions::Hash(hash)
=> {:class=>"flex"}
```

The values of the hash passed to `TagOptions::Hash.new` or `TagOptions::Hash()`
are automatically converted to strings.

```ruby
hash = {disabled: true}
TagOptions::Hash.new(hash)
=> {:disabled=>"true"}
```

`TagOptions::Hash` inherits from `ActiveSupport::HashWithIndifferentAccess`,
implementing a hash where keys `:foo` and `"foo"` are considered to be the same.
It differs from `ActiveSupport::HashWithIndifferentAccess`, however, by storing
the keys as symbols instead of strings to make it easier to pass the hash as
an method argument using double splat, e.g. `some_method **options`.

### combine!

Combine HTML attributes with an existing `TagOptions::Hash` by chaining `at` and
`combine!`

```ruby
options = TagOptions::Hash.new(class: "flex")
options.at(:class).combine!("mt-1")
=> {:class=>"flex mt-1"}
```

Values can also be specified as arrays.

```ruby
options = TagOptions::Hash.new(class: "flex")
options.at(:class).combine!(["mt-1", "mx-2"])
=> {:class=>"flex mt-1 mx-2"}
```

HTML attributes are only added if they don't already exist.

```ruby
options = TagOptions::Hash.new(class: "flex")
options.at(:class).combine!("flex flex-col")
=> {:class=>"flex flex-col"}
```

You can also combine values on nested hashes.

```ruby
options = TagOptions::Hash.new(class: "flex", data: {controller: "dropdown"})
options.at(:data, :controller).combine!("toggle")
=> {:class=>"flex", :data=>{:controller=>"dropdown toggle"}
```

If a nested hash doesn't already exist it will be automatically added.

```ruby
options = TagOptions::Hash.new(class: "flex")
options.at(:data, :controller).combine!("dropdown")
=> {:class=>"flex", :data=>{:controller=>"dropdown"}
```

### set!

Chaining `at` and `set!` functions nearly the same as `combine!` with all same
usage patterns. The major difference is that the set method will override any
existing values.

```ruby
options = TagOptions::Hash.new(class: "flex")
options.at(:class).set!("block")
=> {:class=>"block"}
```

### default!

Chaining `at` and `default!` functions nearly the same as `set!` with all the
same usage patterns. The only difference is that the default method will only
set the specified values if the value is not already specified.

```ruby
options = TagOptions::Hash.new(class: "flex")
options.at(:class).default!("block")
options.at(:role).default!("alert")
=> {:class=>"flex", :role=>"alert"}
```

### remove!

Remove HTML attributes from an existing `TagOptions::Hash` by chaining `at` and
`remove!`.

```ruby
options = TagOptions::Hash.new(class: "flex ml-1 mr-1")
options.at(:class).remove!("mr-1")
=> {:class=>"flex ml-1"}
```

In addition to string values, you can also pass regular expression to `remove!`.

```ruby
options = TagOptions::Hash.new(class: "flex ml-1 mr-2")
options.at(:class).remove!(/m.-\d/)
=> {:class=>"flex"}
```

## Conditional Usage

The `combine!`, `set!`, `default!`, and `remove!` methods allow for values to be
conditionally resolved using an argument array. Where the values are passed
unconditionally and key/value pairs have their key passed _IF_ the value is
true.

```ruby
# assuming `centered?` returns `true`
options = TagOptions::Hash.new(class: "flex")
options.at(:class).combine!("mt-1", "mx-auto": centered?, "mx-2": !centered?)
=> {:class=>"flex mt-1 mx-auto"}
```

```ruby
# assuming `centered?` returns `true`
options = TagOptions::Hash.new(class: "flex")
options.at(:class).set!("block", "mx-auto": centered?, "mx-2": !centered?)
=> {:class=>"block mx-auto"}
```

```ruby
# assuming `centered?` returns `true`
options = TagOptions::Hash.new(role: "alert")
options.at(:class).default!("flex", "mx-auto": centered?, "mx-2": !centered?)
=> {:role=>"alert", :class=>"flex mx-auto"}
```

```ruby
# assuming `centered?` returns `true`
options = TagOptions::Hash.new(class: "flex mx-auto mx-2")
options.at(:class).remove!("mt-1", "mx-auto": centered?, "mx-2": !centered?)
=> {:class=>"flex mx-2"}
```

## Custom Property Resolvers

Chaining `at` to `combine!` or `set!` processes HTML properties similar to
`class`.

- Multiple are allowed
- Multiple values are seperated by a space
- Duplicate values are not added

Tag Options also ships with a special `style` resolver, which can be used by
pass `as: :style` to `at`.

- Multiple values are allowed
- Values must be specified as `property: value;`
- Duplicate `property: value;` pairs are not added
- The `combine!` method will overwrite an existing style property if it exists,
  add properties that don't exist, and leave the remaining properties untouched.
- The `set!` method will overwrite all existing style properties.

```ruby
options = TagOptions::Hash.new(style: "display: block; margin-left: 0;")
options.at(:style, as: :style).combine!("display: flex; margin-right: 0;")
=> {:style=>"display: flex; margin-left: 0; margin-right: 0;"}
```

A `TagOptions::Resolver` class is available if you wish to implement your own
custom handlers. For examples on doing so, see the [built-in
handlers](https://github.com/wamonroe/tag_options/tree/main/lib/tag_options/resolvers).

To register a custom handler:

```ruby
# config/initializers/tag_options.rb
TagOptions.configure do |config|
  config.register_resolver :custom, "MyCustomResolver"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/rspec` to run the tests. You can also run:

- `bin/console` for an interactive prompt that will allow you to experiment
- `bin/rubocop` to run RuboCop to check the code style and formatting

To build this gem on your local machine, run `bundle exec rake build`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/wamonroe/tag_options.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).
