class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex, :user_id
  validates :age, numericality: true
  validates :age, :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: ["red", "green", "blue"]}
  validates :sex, inclusion: { in: ["M", "F"]}

  has_many(
  :rental_requests,
  dependent: :destroy,
  class_name: "CatRentalRequest",
  foreign_key: :cat_id,
  primary_key: :id
  )

  belongs_to(
  :owner,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id
  )


end