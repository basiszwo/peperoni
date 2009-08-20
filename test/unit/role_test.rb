require File.dirname(__FILE__) + '/../test_helper'

class RoleTest < ActiveSupport::TestCase
  should_have_db_column :name
  should_have_db_column :parent_id

  should_have_and_belong_to_many :users
  
end
