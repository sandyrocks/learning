class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :first_name, :last_name, :email, :age, presence: true
  validates :dob, :state, presence: true
  validates_uniqueness_of :email
  validates :mobile_number, length: { is: 10 }
  validates :landline_number, length: { is: 8 }

  def self.get_group_by_contact_count
    Contact.joins(:group).select("
      groups.name,
      contacts.id,
      count(contacts.group_id) as counter
    ").group("contacts.group_id")
  end
end
