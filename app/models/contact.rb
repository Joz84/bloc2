class Contact < ApplicationRecord
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :phone, presence: :true
  validates :email, presence: :true
  validates :message, presence: :true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
