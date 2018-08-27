class Authenticator
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def valid?
    return false unless employee.present?
    if employee.authenticate(password)
      true
    else
      false
    end
  end

  private

  attr_reader :email, :password

  def employee
    Employee.find_by(email: email)
  end

end
