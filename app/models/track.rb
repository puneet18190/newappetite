class Track < ActiveRecord::Base

  belongs_to :playlist
  has_many :likes

end