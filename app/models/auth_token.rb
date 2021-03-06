class AutenticationError < StandardError; end
class InvalidTokenError < StandardError; end

class AuthToken

  def self.encode(payload, exp= 24.hours.from_now)
    payload[:exp] ||= exp.to_i
    JWT.encode(payload, ENV["JWT_SECRET"])
  end

  def self.decode(token)
    payload = JWT.decode(token, ENV["JWT_SECRET"]).first
    HashWithIndifferentAccess.new payload.except("exp")
    rescue JWT::ExpiredSignature
      raise AutenticationError
    rescue JWT::VerificationError, JWT::DecodeError
      raise InvalidTokenError
  end
end
