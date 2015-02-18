class Instructor < User

  has_one :class
  has_one :producer

	validates :type, presence: :true
	validates :email, presence: :true, uniqueness: :true
	validates :password_digest, presence: :true

	has_secure_password

end
