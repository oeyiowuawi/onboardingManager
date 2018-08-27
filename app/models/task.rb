class Task < ApplicationRecord
  belongs_to :employee
  validates(
    :description,
    :employee_id,
    :due_date,
    :created_by_id,
    presence: true
  )

  scope :not_notified, -> { where(notified: false) }
  belongs_to :admin, class_name: "Employee", foreign_key: "created_by_id", optional: true
end
