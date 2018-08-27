class Authenticator
  def initialize(email:, password:)
    @email = email
    @password = password
    @valid = false
  end

  def valid?
    return false unless employee.present?
    if employee.authenticate(password)
      @valid = true
    else
      @valid = false
    end
  end

  def auth_token
    return if @valid == false
    AuthToken.encode(employee_id: employee.id)
  end

  def login
    employee.update(status: true)
  end

  private

  attr_reader :email, :password

  def employee
    @employee ||= Employee.find_by(email: email)
  end

end
