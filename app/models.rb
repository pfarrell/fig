require 'sequel'
require 'logger'
  
$console = ENV['RACK_ENV'] == 'development' ? Logger.new(STDOUT) : nil
DB = Sequel.connect(
  ENV['FIG_DB'] || 'postgres://localhost/fig',
  logger: $console,
  test: true
)

DB.sql_log_level = :debug
DB.extension(:pagination)
DB.extension(:pg_array, :pg_json)
DB.extension(:connection_validator)

DB.pool.connection_validation_timeout = 300

Sequel::Model.plugin :timestamps
Sequel::Model.plugin :json_serializer

require 'models/site'
