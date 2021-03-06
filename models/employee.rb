require_relative 'application_record'
class Employee < ApplicationRecord
  validates :first_name, presence: { message: "Please specify employee's first name." }
  validates :last_name, presence: { message: "Please specify employee's last name." }
  validates_inclusion_of :contract_type, in: ["contract of employment", "contract agreement"],
  message: "Not supported type of contract."
  validates_numericality_of :hourly_rate, greater_than_or_equal_to: 13.70, allow_nil: true
  validates_numericality_of :monthly_rate, greater_than_or_equal_to: 2100.00, allow_nil: true
  validates_numericality_of :provision, greater_than_or_equal_to: 0,
  message: "Provision must not be negative."

  validates :hourly_rate,
    presence: { message: "Employee on agreement contract must have specified hourly rate." },
    if: :agreement_contract?
  validates :monthly_rate, absence: true, if: :agreement_contract?

  validates :monthly_rate,
    presence: { message: "Employee on contract of employment must have specified monthly rate." },
    if: :employment_contract?
  validates :hourly_rate, absence: true, if: :employment_contract?

  default_scope -> { order("created_at ASC") }

  def employment_contract?
    contract_type == "contract of employment"
  end

  def agreement_contract?
    contract_type == "contract agreement"
  end
end
