class Api::V1::CategoriesController < Api::V1::BaseController

  before_action :find_user, only: %i[sync_data]
  before_action :set_date, only: %i[sync_data]

  def sync_data
    category_data = Category.all
    categories = serialize_collection(category_data, CategorySerializer)
    bank_data = Bank.all
    banks = serialize_collection(bank_data, BankSerializer)
    expenses_data = @user.expenses.where(date: @start_date..@end_date)
    expenses = ActiveModel::Serializer::CollectionSerializer.new(expenses_data, serializer: ExpenseSerializer)
    data_object = DataBreakDownService.new(@user, @start_date, @end_date).set_category_and_bank_wise_data
    category_wise_data = data_object[0]
    bank_wise_data = data_object[1]
    api_success(200, 'Sync Data', {categories: categories, banks: banks, category_wise_data: category_wise_data, bank_wise_data: bank_wise_data, expenses: expenses})
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def set_date
    @start_date = params[:start_date].to_datetime
    @end_date = params[:end_date].to_datetime
  end
end