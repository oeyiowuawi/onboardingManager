require "rails_helper"

describe AuthToken do
  describe ".encode" do
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

  describe ".decode" do
    context "when the token is valid" do
      it "returns an hash representing the encoded payload" do
        token = AuthToken.encode(user_id: 1, exp: (Time.now + 3600).to_i)

        result = AuthToken.decode(token)

        expect(result).to eq( { "user_id" => 1 })
      end
    end
  end
end
