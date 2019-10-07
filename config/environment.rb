require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'game-runner_development')
# old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
require_all 'lib'
