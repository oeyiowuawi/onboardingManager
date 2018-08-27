class Task < ApplicationRecord
  belongs_to :employee
  validates(
    :description,
    :employee_id,
    :due_date,
    :created_by_id,
    presence: true
  )
end
