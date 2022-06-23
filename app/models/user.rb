class User < ApplicationRecord
  attr_accessor :password

	validates :username, :email, presence: true
	validates :username, :email, uniqueness: { case_sensitive: false }

	def self.find_by_credentials(username, password)
		user = User.find_by(username: username)
		user && user.is_password?(password) ? user : nil
	end

	def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
		self.session_token = SecureRandom.urlsafe_base64
		self.save!
		self.session_token
	end
end
