source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'thin',                       '1.2.11'
gem 'hpricot',                    '0.8.3'
gem 'formtastic',                 '1.2.4'
gem 'haml',                       '3.1.2'
gem 'nokogiri',                   '1.4.4'
gem 'paperclip',                  '2.3.8'
gem 'aws-s3',                     '0.6.2'
gem 'delayed_job',                '2.1.4'
gem 'delayed_job_admin',          '1.0.3'
gem 'faker',                      '0.9.5'
gem 'devise',                     '1.5.2'
gem 'omniauth-github',            '1.0.1'
gem 'nokogiri',                   '1.4.4'
gem 'curb',                       '0.7.15'
gem 'sanitize',                   '2.0.2'
gem 'will_paginate',              '~> 3.0.2'
gem 'rake',                       '~> 0.9.2'
gem 'twitter',                    '2.0.0'
gem 'hirefireapp',                '0.0.5'
gem 'jquery-rails',               '1.0.19'
gem 'bootstrap-sass',             '1.4.0'
gem 'airbrake',                   '3.0.5'
gem 'mini_fb',                    '~> 1.1.7'

# Use the Anideo fork of mp4info, based on this sound piece of advice:
# http://lindsaar.net/2010/9/16/bundler_and_public_git_sources
gem 'user-agent',                 :git => 'git://github.com/anideo/user-agent.git', :ref => 'be90bccacd444c24455fecb851752361eabb7939'
gem 'acts-as-taggable-on',        :git => 'git://github.com/diaspora/acts-as-taggable-on.git', :ref => 'c3592fe1a906f6ff1cd12766c5cf1152c51eec40'

# i'd like this to be RedCarpet when that's integrated into haml
gem 'rdiscount',                  '1.6.8'
gem 'htmlentities',               '4.3.0'
gem 'pg',                         '0.11'
gem 'retryable',                  '1.2.5'
gem 'coffee-filter',              '0.1.1'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
#
# Install these autotest gems if you want autotest
# gem 'autotest-standalone','4.5.5'
# gem 'autotest-growl',     '0.2.9'
# gem 'autotest-fsevent',   '0.2.4'

group :test, :development do
  gem 'parallel_tests',     '0.4.21'
  gem 'rspec-rails',        '2.6.1'
  gem 'ruby_parser',        '2.0.5'
  gem 'capybara',           '1.0.0.beta1'
  gem 'database_cleaner',   '0.6.0'
  gem 'shoulda',            '>= 3.0.0.beta'
  gem 'factory_girl',       '1.3.3'
  gem 'launchy',            '0.3.7'
end

group :test do
  gem 'webmock',            '1.7.6'
  gem 'timecop',            '0.3.5'
  gem 'email_spec',         '1.1.1'
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier',     '>= 1.0.3'
  gem 'eco',          '~> 1.0.0'
end