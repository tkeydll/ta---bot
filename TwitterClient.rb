require 'twitter'

class   TwitterClient

  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def initialize
    @text = ["I like heroku.",
             "I love Azure.",
             "I don't like ...",
             "DevOps!!",
             "Tweet with @gem!"
            ]

    @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
        config.access_token = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def update(text)
    @client.update(text)
  end
  
  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

end

if __FILE__ == $0
  TwitterClient.new.random_tweet
end
