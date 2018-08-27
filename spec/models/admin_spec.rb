require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { is_expected.to belong_to(:department) }
  it { is_expected.to belong_to(:employee) }
end
