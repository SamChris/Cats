class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex
  validates :age, numericality: true
  validates :age, :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: ["red", "green", "blue"]}
  validates :sex, inclusion: { in: ["M", "F"]}
end