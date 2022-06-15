source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in tag_options.gemspec.
gemspec

group :development do
  gem "bundler-audit"
  gem "rubocop-rspec"
  gem "standard"
end

group :development, :test do
  gem "debug"
end

group :test do
  gem "simplecov", require: false
end
