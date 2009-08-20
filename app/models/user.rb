class User < ActiveRecord::Base
  
  after_create :deliver_account_activation_instructions!, :set_base_role
  
  # authlogic configuration
  acts_as_authentic do |c|
    c.login_field = 'email'
    c.logged_in_timeout = 60.minutes
    c.validate_login_field = false
  end
  
  has_and_belongs_to_many :roles
  
  state_machine :status, :initial => :pending do
    event :activate do
      transition :pending => :active
    end

    event :suspend do
      transition :active => :suspended
    end

    event :unsuspend do
      transition :suspended => :active
    end

    event :delete do
      transition [:pending, :active, :suspended] => :deleted
    end
  end
  
  named_scope :active, :conditions => "users.status = 'active'"
  named_scope :pending, :conditions => "users.status = 'pending'"
  named_scope :suspended, :conditions => "users.status = 'suspended'"
  named_scope :deleted, :conditions => "users.status = 'deleted'"

  validates_presence_of :username
  validates_presence_of :roles, :on => :update
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  def deliver_account_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_account_activation_instructions(self)
  end
  

  def has_role? *role
    role.to_a.any? do |role|
      all_role_identifiers.include? role
    end
  end

  def all_roles 
    @all_roles ||= ([self.roles] + self.roles.map(&:ancestors)).flatten
  end

  def all_role_identifiers 
    @all_role_identifiers ||= all_roles.map(&:name)
  end
  
end
