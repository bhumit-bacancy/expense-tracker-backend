class DataBreakDownService
  
  def initialize(user, start_date, end_date)
    @user = user
    @start_date = start_date
    @end_date = end_date
  end

  def set_category_and_bank_wise_data
    set_data
    category_data = {}
    bank_data = {}
    @expenses.group_by(&:category_id).each do |category_id, expenses|
      category = Category.find_by(id: category_id)
      category_data["#{category.name}"] = expenses.sum(&:amount)
    end

    @expenses.group_by(&:bank).each do |bank, expenses|
      bank = Bank.find_by(id: bank)
      bank_data["#{bank.name}"] = expenses.sum(&:amount)
    end
    [category_data, bank_data]
  end

  def set_data
    @expenses = @user.expenses.where(date: @start_date..@end_date)
  end
end
