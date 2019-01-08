require 'database_cleaner'

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  DatabaseCleaner.add_cleaner(:active_record, model: Genre)

  config.before(:each) do
  	DatabaseCleaner.start
  end

  config.append_after(:each) do
  	DatabaseCleaner.add_cleaner
  end

end