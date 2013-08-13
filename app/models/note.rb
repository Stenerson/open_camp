class Note < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :project
end
