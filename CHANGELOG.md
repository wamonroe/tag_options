# Changelog

## [Unreleased]

## [1.4.0] - 2023-04-15

- Removed support for Ruby 2.7.

## [1.3.1] - 2023-03-06

- Fixed a bug where keys with empty values were being populated when using
  `at()` against a non-existant key and the values passed to `combine!`, `set!`,
  or `default` resolved to no values or where `remove!` removed all values.

## [1.3.0] - 2023-03-03

- Added `at().remove!` option for removing values.

**NOTE**: If you have implemented custom resolvers, you will need to modify them
in order to support `remove!`. For examples, see the [built-in
handlers](https://github.com/wamonroe/tag_options/tree/main/lib/tag_options/resolvers)
for more information.

## [1.2.1] - 2023-03-02

- Fixed bug introduced when switching to
  `ActiveSupport::HashWithIndifferentAccess` that prevented a `TagOptions::Hash`
  from being passed to a method using double splat, e.g. `some_method
**options`.

## [1.2.0] - 2023-03-02

- Added `at().default!` option for setting values that are not already present.
- Fix for passing an array of values to `combine1` or `set!`

## [1.1.0] - 2023-03-01

- Switched to inheriting from `ActiveSupport::HashWithIndifferentAccess`.
- Added before/after/around initialize callback support.

## [1.0.0] - 2022-06-14

- Rewrote and simplified TagOptions::Hash and supporting classes.

**BREAKING CHANGES**: Read documentation for updated usage before updating.

## [0.9.3] - 2021-11-11

- Added TagOptions::Hash() ease-of-use method
- Bug fixes for Ruby 3.0

## [0.9.2] - 2021-11-09

- Added optional TailwindCSS property handler

## [0.9.1] - 2021-11-08

- Implemented property handling

## [0.9.0] - 2021-11-04

- Initial release
