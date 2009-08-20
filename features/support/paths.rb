module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the login page/
      '/login'
    when /the forgot password form/
      new_password_reset_path
    when /the reset password form/
      edit_password_reset_path
    when /the signup form/
      '/account/new'
    when /the account page/
      '/account'
    when /the resend activation page/
      new_activation_path
    when /the login page/
      login_path
    when /the admin root page/ 
      admin_path
    when /the dashboard page/
      admin_path
    when /the root page/
      '/'
    when /the index backend user page/
      admin_backend_users_path
    when /the new backend user page/
      new_admin_backend_user_path
    when /^the edit backend user page (.*)$/i
      edit_admin_backend_user_path($1)
    
    
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
