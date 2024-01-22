class Api::V1::AuthController < Api::V1::BaseController

  def login
    user = User.find_by(username: params[:username])
    if (user && user.authenticate(params[:password]))
      api_success(200, 'Expenses was successfully fetched.', user: user)
    else
      api_error(404, "User not found")
    end
  end 
end
