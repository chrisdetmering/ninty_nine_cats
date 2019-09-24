# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#

class CatRentalRequest < ApplicationRecord 
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING) } 
  validates :cat_id, :start_date, :end_date, presence: true 
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: self.cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date', 
      start_date: start_date, end_date: end_date)
  end 

  def overlapping_approved_request
    overlapping_requests.where('status = \'APPROVED\'') 
  end 

  def overlapping_pending_request
    overlapping_requests.where('status = \'PENDING\'') 
  end 

  def does_not_overlap_approved_request
    
    return if self.denied? 

    if overlapping_approved_request.exists? 
      errors[:base] << "Request conflicts with existing approved request"
    end
  end 

  def approved!
   self.transaction do 
    self.status = 'APPROVED'
    self.save!

    overlapping_pending_request.update_all(status: "DENIED")
   end 
  end 

  def deny! 
    self.status = 'DENIED'
    self.save!
  end 

  def pending? 
    self.status == "PENDING"
  end 

  def denied?
    self.status == "DENIED"
  end 
end 



