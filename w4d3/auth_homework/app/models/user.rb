class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "password can\'t be blank" }
  validates :password, length: { minimum: 10, allow_nil: true }
  before_validation :ensure_session_token


  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    #This method resets the user's session_token and saves the user'
  end

  def ensure_session_token
    #This method makes sure that the user has a session_token set, setting one if none exists
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
