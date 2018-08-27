FactoryBot.define do
  factory :task do
    description "MyString"
    employee 
    done false
    due_date Date.current
    created_by_id 1
  end
end
