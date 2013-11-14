class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :start_date, :end_date, :status

  validates :cat_id, :start_date, :end_date, :status, presence: true

  validates :status,  inclusion: {in: ["PENDING", "APPROVED", "DENIED"] }

  #before_validation :status ||= "PENDING"

  validate :overlapping_approved_requests

  belongs_to(
  :cat,
  class_name: "Cat",
  foreign_key: :cat_id,
  primary_key: :id
  )

  def overlapping_requests
    requests = CatRentalRequest.find_all_by_cat_id(self.cat_id)
    requests.select! do |request|
      self.start_date.between?(request.start_date, request.end_date) ||
       self.end_date.between?(request.start_date, request.end_date) ||
       request.start_date.between?(self.start_date, self.end_date)
    end

    requests
  end

  def overlapping_approved_requests
    reqs = overlapping_requests
    overlapping_and_approved = reqs.select do |request|
      request.status == "APPROVED" && request.id != self.id
    end

    unless overlapping_and_approved.empty?
      errors[:overlap] << "this request overlaps with an approved request!"
    end
  end

  def overlapping_pending_requests
    reqs = overlapping_requests
    overlapping_and_pending = reqs.select do |request|
      request.status == "PENDING" && request.id != self.id
    end

    overlapping_and_pending
  end

  def pending?
    self.status == "PENDING"
  end

  def deny!
    self.update_attribute(:status, "DENIED")
    self.save!
  end

  def approve!
    # self.update_attribute(:status, 'APPROVED')
    overlapping_and_pending = overlapping_pending_requests
    overlapping_ids = overlapping_and_pending.map{|req| req.id}

    CatRentalRequest.transaction do
      overlapping_and_pending.each do |request|
        request.update_attribute(:status, "DENIED")
        request.save!
      end

      self.update_attribute(:status, "APPROVED")
      self.save!
    end

  end


end
