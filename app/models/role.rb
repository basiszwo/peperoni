class Role < ActiveRecord::Base  
  acts_as_tree
  
  has_and_belongs_to_many :users  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  
  def self.backend
    roles = []
    r = Role.find_by_name('backend_user')
    roles << r
    r.descendants.each { |r| roles << r }
    roles
  end
  
  def self.frontend
    roles = []
    r = Role.find_by_name('frontend_user')
    roles << r
    r.descendants.each { |r| roles << r }
    roles
  end
  
  def descendants
 	  descendants = []
 	  self.children.each { |child|
 	    descendants += [child]
 	    descendants += child.descendants
 	  } unless self.children.empty?
 	  descendants
 	end
end
