require "rails_helper"

describe AuthToken do
  describe "#encode" do
    it "calls JWT encode method" do
      allow(JWT).to receive(:encode).and_call_original

      AuthToken.encode(user_id: 1)

      expect(JWT).to have_received(:encode)
    end

    it "returns a string" do
      token = AuthToken.encode(user_id: 1)

      expect(token).to be_a(String)
    end
  end
end
