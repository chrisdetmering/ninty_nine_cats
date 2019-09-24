# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  description :text             not null
#  sex         :string(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord 

include ActionView::Helpers::DateHelper

  CAT_COLORS = %w(gray white ginger brown cream)
  validates :color, inclusion: { in: CAT_COLORS }
  validates :sex, inclusion: { in: %w(M F) } 
  validates :birth_date, :name, :description, presence: true 
  
 has_many :rental_requests, 
  class_name: :CatRentalRequest,
  dependent: :destroy

  def age 
    time_ago_in_words(birth_date)
  end 
 
end 
