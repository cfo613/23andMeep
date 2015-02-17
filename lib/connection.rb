require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3",
  :database => "23andmeep.db",
});

ActiveRecord::Base.logger = Logger.new(STDOUT)
