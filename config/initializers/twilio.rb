Twilio.configure do |config|
  config.account_sid = ENV["TWILIO_SID"]
  config.auth_token  = ENV["TWILIO_AUTH"]
end

OUR_NUMBER = ENV["TWILIO_PHONE"]
