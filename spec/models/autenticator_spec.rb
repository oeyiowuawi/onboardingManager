
require "rail_helper"

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
end
