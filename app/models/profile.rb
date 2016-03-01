class Profile < ActiveRecord::Base
  # Default scope
  default_scope {order(name: :asc)}

  # Relationships
  has_one :boundary
  has_many :users
  has_many :companies
end
