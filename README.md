**NOTICE!** Forked by
- https://bitbucket.org/epub_dev/wordpress-wxr/src/master/
- https://rubygems.org/gems/wordpress-wxr/

To build and deploy a new gem after incrementing the version number in lib/wordpress/wxr/version.rb

gem build wordpress-wxr.gemspec
bundle exec rake release