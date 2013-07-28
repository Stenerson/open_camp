class Task < ActiveRecord::Base
  attr_accessible :due_date, :description, :name
  belongs_to :user

  validates :name, presence: true, length: {minimum:5, maximum:30}
  validates :description, presence: true, length: {within: 2..160}
  validate :due_date_cannot_be_in_the_past

  private
  	
    def due_date_cannot_be_in_the_past
    	unless due_date.blank?
    		if due_date < Date.today
    			errors.add(:due_date, "Date cannot be in the past")
    		end
      end
    end


end
