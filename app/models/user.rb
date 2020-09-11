class User
  include Mongoid::Document
  
  field :first_name, type: String
  field :last_name, type: String
  field :phone_number, type: String

  has_and_belongs_to_many :exam

  def find_user(first_name, last_name, phone_number)
    self.first_name.downcase == first_name.downcase && 
    self.last_name.downcase == last_name.downcase && 
    self.phone_number.downcase == phone_number.downcase
  end
end
