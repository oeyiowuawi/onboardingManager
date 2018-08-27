class AuthToken

  def self.encode(payload, exp= 24.hours.from_now)
    payload[:exp] ||= exp.to_i
    JWT.encode(payload, ENV["JWT_SECRET"])
  end
end
