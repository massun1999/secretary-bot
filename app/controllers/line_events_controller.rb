class LineEventsController < ApplicationController
  #skip_before_action :verify_authenticity_token
  require 'line/bot'

  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
  end

  def callback

    @post = Post.offset( rand(Post.count) ).first
    @reply = Reply.offset( rand(Reply.count) ).first
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)

    events.each do |event|

      response = @post.name
      ryp = @reply.text

      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          if event.message['text'].include?("【回答】")
            message = {
              type: 'text',text: ryp
            }
            client.reply_message(event['replyToken'],message)
          else
            message = {
              type: 'text',
              text: response
            },
            message = {
              type: 'text',
              text: "【回答】と付け加えて答えてや！"
            }
            client.reply_message(event['replyToken'],message)
          end
        end
      when Line::Bot::Event::Follow
        @user = event['source']['userId']
        User.find_or_create_by(user_id: @user)
      when Line::Bot::Event::Unfollow
        user_id = event['sourse']['userId']
        @user = User.find_by(user_id: user_id)
        if @user.present?
          @user.destroy 
        end
      end
    end
    "OK"
  end

end
