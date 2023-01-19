source "https://rubygems.org"

gemspec

gem "bundler", "~> 1.3"
gem "rails", "5.2.2"
gem "rake"
gem "sqlite3", "~> 1.3.13"

group :test do
  gem "pry-rails"
  if ENV['RSPEC2']
    gem "rspec-rails", "~> 2.14.1"
  elsif ENV['RSPEC299']
    gem "rspec-rails", "~> 2.99.0"
  else
    gem "rspec-rails"
  end
  gem "weak_parameters"
  gem "rack-test"
  gem "redcarpet"
  gem "responders"
end
