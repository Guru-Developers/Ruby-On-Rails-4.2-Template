class UsersController < ApplicationController
  
  def show
    if "#{params[:id]}" == "#{session[:user_id]}"
      @user = User.find(params[:id]) 
      #find all patients that are associated with this surgeon
      @patient = Patient.new
      @current_patients = []
      @current_patients += Patient.where(surgeon: params[:id]).to_a if Patient.find_by(surgeon: params[:id])
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user #also written as redirect_to user_url(@user)
      flash[:success] = "Welcome Dr. #{@user.name}"
    else
      render 'new'
    end
  end

  private

  #the following methods protect agaisnt cross site scripting attacks
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
