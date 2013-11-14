class SessionHolder < ActiveRecord::Base
  attr_accessible :user_id, :session_token, :environment

  belongs_to(
  :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id
  )

end
