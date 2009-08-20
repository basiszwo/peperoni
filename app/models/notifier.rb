class Notifier < ActionMailer::Base  
  def password_reset_instructions(user)  
    subject       "You want to reset your password"
    from          "Peperoni"  
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end
  
  def account_activation_instructions(user)  
    subject       "Please activate your account"
    from          "Peperoni"  
    recipients    user.email
    sent_on       Time.now
    body          :activate_account_url => activate_account_url(user.perishable_token),
                  :user => user
  end

end
