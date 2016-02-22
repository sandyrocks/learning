class Contact < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :email, :age, presence: true
  validates :dob, :state, :mobile_number, :landline_number, presence: true
  validates_uniqueness_of :email
end
