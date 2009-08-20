class BackendUser < User
  
  private
  
  def set_base_role
    self.roles = [ Role.find_by_name!('backend_user') ]
  end
  
end
