class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :tasks
  has_many :notes
end
