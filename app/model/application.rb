require 'active_record'

ADAPTER = 'postgresql'
DB_NAME = 'home_slack_bot'

ActiveRecord::Base.establish_connection(
  adapter: ADAPTER,
  host: ENV['DB_ADDRESS'],
  user: ENV['DB_USERNAME'],
  database: DB_NAME
)
