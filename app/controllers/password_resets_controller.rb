class PasswordResetsController < ApplicationController
  def new
  end

  def create
	  user = Administrator.find_by_email(params[:email])
	  if user
	  user.send_password_reset
    flash[:success] = "Email sent with password reset instructions."
	  redirect_to root_url
	else
    flash[:danger] = "Email does not exist."
		redirect_to root_url

	end
end

  def edit
  	 @administrator = Administrator.find_by_password_reset_token!(params[:id])
  end

  def update
  @user = Administrator.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path
    flash[:danger] = "Password &crarr; 
      reset has expired."
  elsif @user.update_attributes(passwordreset_params)
    redirect_to root_url
    flash[:success] = "Password has been reset. You can login now"
  else
    render :edit
  end

end

def passwordreset_params
      params.require(:administrator).permit(:password, :password_confirmation)
    end
end
