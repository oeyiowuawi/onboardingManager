require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:employee_id) }
  it { is_expected.to validate_length_of(:due_date) }
  it { is_expected.to validate_presence_of(:created_by_id) }
  it { is_expected.to belong_to(:employee)}
end
