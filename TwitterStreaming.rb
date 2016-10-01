require 'twitter'


class TwitterStreaming

    def initialize
        @client_streaming = Twitter::Streaming::Client.new do |config|
            config.consumer_key = ENV['CONSUMER_KEY']
            config.consumer_secret = ENV['CONSUMER_SECRET']
            config.access_token = ENV['ACCESS_TOKEN']
            config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
        end
    end

    def test
        client_streaming.user do |object|
            case object
            when Twitter::Tweet
                object.text
        end
    end


end

