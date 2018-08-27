
require "rails_helper"

describe Authenticator do
  describe "#valid" do
    context "when the employee does not exist" do
      it "is not valid" do
        authenticator = Authenticator.new(email: "olalekan@andela.com",
                                          password: "1234ght")

        expect(authenticator).to_not be_valid
      end
    end
  end

  context "when employee exists" do
    context "and email and password match" do
      it "is valid" do
        employee = create(:employee)
        authenticator = Authenticator.new(email: employee.email,
                                          password: employee.password)

        expect(authenticator).to be_valid
      end
    end

    context "and email and password does not match" do
      it "is not valid" do
        employee = create(:employee)
        authenticator = Authenticator.new(email: employee.email,
                                          password: "invalid_password")

        expect(authenticator).not_to be_valid
      end
    end
  end
end
