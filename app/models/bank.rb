class Bank < ApplicationRecord
  has_many :expenses
  PERMITTED_PARAMS = [:name].freeze

end