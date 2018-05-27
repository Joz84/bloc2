class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum sex: [ :male, :female ]

  validates :country, presence: :true
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :birthday, presence: :true
  validates :phone, presence: :true
  validates :sex, presence: :true

  after_create :send_inscription

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def create_charge(token)
    customer = Stripe::Customer.create( source: token, email: email )
    self.stripe_id = customer.id
    Stripe::Charge.create(
      customer:     customer.id,
      amount:       4500,
      description:  "Inscription #{full_name}",
      currency:     "eur"
    )
  end

  private

  def send_inscription
    UserMailer.inscription(self).deliver_now
  end
end
