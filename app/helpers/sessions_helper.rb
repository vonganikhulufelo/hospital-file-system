module SessionsHelper
	def log_in(user)
    session[:user_id] = user.id
    session[:role] = user.role
    session[:expires_at] = Time.now + 1.minutes
  end

  # Returns the current logged-in user (if any).
  def current_user
    user_id = session[:user_id]

  if (session[:role] == 'pharmacist')
      @current_user ||= Pharmacist.find_by(id: user_id)
      elsif (session[:role] == 'doctor')
      @current_user ||= Doctor.find_by(id: user_id)
      elsif (session[:role] == 'receptionist')
      @current_user ||= Receptionist.find_by(id: user_id)
      elsif (session[:role] == 'nurse')
      @current_user ||= Nurse.find_by(id: user_id)
      elsif (session[:role] == 'administrator')
      @current_user ||= Administrator.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      session.delete(:user_id)
    @current_user = nil
    root_path
  end
  end


  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

   def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
