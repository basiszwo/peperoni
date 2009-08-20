class FrontendUser < User
  
  attr_accessor :passwords_required # give me an instance variable
  attr_protected :passwords_required # no mass assignments
  
  validates_presence_of :password, :if => :passwords_required?
  validates_confirmation_of :password, :if => :passwords_required?
  
  private
  
  def passwords_required?
    self.passwords_required
  end
  
  def set_base_role
    self.roles = [ Role.find_by_name!('frontend_user') ]
  end
end
