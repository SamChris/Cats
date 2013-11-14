class User < ActiveRecord::Base
   attr_accessible :user_name, :password, :session_token
   validates :user_name, uniqueness: true
   before_validation :set_session_token

   def set_session_token
     session_token = SecureRandom::urlsafe_base64(16)
     if self.session_token.nil?
       self.update_attribute(:session_token, session_token)
     end
     # self.session_token = do something if self.session_token.nil?
   end

   def reset_session_token!
     session_token = SecureRandom::urlsafe_base64(16)
     self.update_attribute(:session_token, session_token)
     self.save!
   end

   def password=(password)
     self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
     BCrypt::Password.new(self.password_digest).is_password?(password)
   end

   def self.find_by_credentials(user_name, password)
     u = find_by_user_name(user_name)
     return false if u.nil?
     return u if u.is_password?(password)
     false
   end

end
