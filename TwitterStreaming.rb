require 'twitter'


class TwitterStreaming

    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

    def initialize
        @client_streaming = Twitter::Streaming::Client.new do |config|
            config.consumer_key = ENV['CONSUMER_KEY']
            config.consumer_secret = ENV['CONSUMER_SECRET']
            config.access_token = ENV['ACCESS_TOKEN']
            config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
        end
    end

    def stream
        @client_streaming.user do |object|
            case object
            when Twitter::Tweet
                puts object.text
            end
        end
    end

end

if __FILE__ == $0
  TwitterStreaming.new.stream
end
