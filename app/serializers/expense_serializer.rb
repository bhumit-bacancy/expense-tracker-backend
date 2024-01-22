class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :description, :category_id, :date, :transaction_type, :bank_id, :amount, :user_id
  attribute :bank_name

  def bank_name
    object.bank&.name
  end

  attribute :category_name
  
  def category_name
    object.category&.name
  end
end
