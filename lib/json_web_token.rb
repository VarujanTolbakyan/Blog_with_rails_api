require 'jwt'

class JsonWebToken
  class << self
    # Encodes and signs the payload (e.g. the user email) using our app's secret key
    # The result also includes the expiration date.
    def encode(payload)
      payload['exp'] = 1.days.from_now.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    # Decode the JWT to get the user email
    def decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    end

    # Validates the payload hash for expiration
    def valid_payload?(payload)
      expired?(payload) ? false : true
    end

    # Validates if the token is expired by exp parameter
    def expired?(payload)
      Time.at(payload['exp']) < Time.now
    end
  end
end