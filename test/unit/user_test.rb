require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_db_column :username
  should_have_db_column :email
  should_have_db_column :crypted_password
  should_have_db_column :type
  should_have_db_column :status
  should_have_db_column :password_salt
  should_have_db_column :persistence_token
  should_have_db_column :single_access_token
  should_have_db_column :perishable_token
  should_have_db_column :login_count
  should_have_db_column :failed_login_count
  should_have_db_column :last_request_at
  should_have_db_column :current_login_at
  should_have_db_column :last_login_at
  should_have_db_column :current_login_ip
  should_have_db_column :last_login_ip
  should_have_db_column :created_at
  should_have_db_column :updated_at
  
  should_have_and_belong_to_many :roles
  
  should_have_named_scope :active, :conditions => "users.status = 'active'"
  should_have_named_scope :pending, :conditions => "users.status = 'pending'"
  should_have_named_scope :suspended, :conditions => "users.status = 'suspended'"
  should_have_named_scope :deleted, :conditions => "users.status = 'deleted'"
end
