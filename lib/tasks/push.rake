namespace :push_message do
  desc "push_message"
  task push_message_morning: :environment do
    message = {
      type: 'text',
      text: "朝やで！ワシは二日酔いでしんどいわぁ〜"
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
    User.all.each do |user|
      client.push_message(user.user_id, message)
    end
  end

  task push_message_noon: :environment do
    message = {
      type: 'text',
      text: "そろそろ大喜利の時間っちゃう？"
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
    User.all.each do |user|
      client.push_message(user.user_id, message)
    end
  end

  task push_message_night: :environment do
    message = {
      type: 'text',
      text: "うまい酒でも飲みながら大喜利せえへんか？"
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
    User.all.each do |user|
      client.push_message(user.user_id, message)
    end
  end
end