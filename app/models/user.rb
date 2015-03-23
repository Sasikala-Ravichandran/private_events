class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :remember_token
  
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  
  has_many :attendance, foreign_key: "attendees_id"
  has_many :attending_events, through: :attendance

 def upcoming_events
  self.attending_events.upcoming
 end

 def past_events
  self.attending_events.past
 end

 def User.generate_token
    SecureRandom.urlsafe_base64
  end
 
   def User.digest(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end
 
  def remember
     self.remember_token = User.generate_token
     update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
  	update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
=begin

Login 
1) session controller
2) New form 
3) sessionhelper
   Login(storing the session)	current_user(retrieving from session) logged_in? logout(destroying session)

if remember_me == 1
0) virutal attribute remember_token
1) create column in db for remeber_digest

1) generate token
2) convert token to digest
3) store the generated token in remember_token
3) store the digest in remeber_digest

4) put token into cookie
5) current_user if authenticated

logout
1) digest = nil
2) cookies delete
3) session delete
4) current_user = nil
=end