class CreateUsersAndRoles < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :username      
      t.string    :email,               :null => false
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.string    :status
      t.string    :type

      t.timestamps
    end
    
    add_index :users, :email
    add_index :users, :persistence_token
    add_index :users, :last_request_at
    
    create_table :roles do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    
    create_table :roles_users, :id => false do |t|
      t.integer :role_id
      t.integer :user_id
    end
    
    Role.create(:name => 'frontend_user')
    Role.create(:name => 'backend_user')
  end

  def self.down
    drop_table :users
    drop_table :roles
    drop_table :roles_users
  end
end
