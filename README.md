To build and deploy a new gem after incrementing the version number in lib/wordpress/wxr/version.rb

gem build wordpress-wxr.gemspec
bundle exec rake release