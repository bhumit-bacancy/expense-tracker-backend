class Expense < ApplicationRecord
  enum transaction_type: %w[Cash Cheque CreditCard Transfer]
  belongs_to :category
  belongs_to :bank
  belongs_to :user
  PERMITTED_PARAMS = [:description, :category_id, :date, :transaction_type, :bank_id, :amount, :user_id].freeze

end

# Bank.create(name: "HDFC")
# Bank.create(name: "ICICI")
# Bank.create(name: "BOI")
# Bank.create(name: "BOB")
# Bank.create(name: "IDFC")
# Bank.create(name: "SBI")