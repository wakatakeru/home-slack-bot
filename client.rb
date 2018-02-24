require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts '[Successfully] Connection Establish'
end

client.on :message do |data|
  case data.text
  when 'hi'
    client.web_client.chat_postMessage channel: data.channel, text: 'ウェイ'
  when 'sc'
    client.web_client.chat_postMessage channel: data.channel, text: '今日の予定は'
  when 'wt'
    client.web_client.chat_postMessage channel: data.channel, text: '今日の天気は'
  when 'todo'
    client.web_client.chat_postMessage channel: data.channel, text: 'やることです'
  when /^todo add/
    client.web_client.chat_postMessage channel: data.channel, text: "やることリストに #{data.text.split(' ')[2]} を追加したよ"
  when /^bl add/
    client.web_client.chat_postMessage channel: data.channel, text: "買い物リストに #{data.text.split(' ')[2]} を追加したよ"
  when 'ft'
    client.web_client.chat_postMessage channel: data.channel, text: '今日の運勢は'
  end
end

client.start!
