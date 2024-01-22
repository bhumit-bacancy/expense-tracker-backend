class Api::V1::ExpensesController < Api::V1::BaseController

  before_action :find_user, only: %i[index]

  def index
    return api_error(400, "User not found") unless @user
    @expenses = @user.expenses.order(id: :desc)
    if @expenses
      api_success 200, 'Expenses was successfully fetched.',
                  ActiveModel::Serializer::CollectionSerializer.new(@expenses,
                                                                    serializer: ExpenseSerializer)
    else
      api_error(400, "No data")
    end
  end

  def create
    @expense = Expense.new(expense_params)
    @user = User.find(params[:expense][:user_id])
    if @expense.save!
      @expenses = @user.expenses.order(id: :desc).includes([:category, :bank])
      api_success(200, 'Expense was successfully created.', ActiveModel::Serializer::CollectionSerializer.new(@expenses,
      serializer: ExpenseSerializer))
    else
      api_error(400, @expense.errors.first.message)
    end
  end

  private

  def expense_params
    params.require(:expense).permit(Expense::PERMITTED_PARAMS)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end