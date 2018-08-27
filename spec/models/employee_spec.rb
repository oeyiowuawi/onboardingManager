require "rails_helper"

describe Employee do
  subject { build(:employee, password: "12356kkg", name: "olalekan", department_id: 1)}
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:department_id) }
    it { is_expected.to validate_length_of(:name).is_at_least(2) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:password).is_at_least(7) }
    it { is_expected.to have_secure_password }
    it { is_expected.to belong_to(:department)}
    it { is_expected.to have_many(:tasks)}
  end
end
