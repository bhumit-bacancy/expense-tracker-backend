class Category < ApplicationRecord
  has_many :expenses
  PERMITTED_PARAMS = [:name].freeze

end