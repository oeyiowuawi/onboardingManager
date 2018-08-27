require "rails_helper"

describe AuthToken do
  describe "#encode" do
    it "calls JWT encode method" do
      allow(JWT).to receive(:encode).and_call_original

      AuthToken.encode(user_id: 1)

      expect(JWT).to have_received(:encode)
    end
  end
end
