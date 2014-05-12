class Playlist < ActiveRecord::Base

  belongs_to :user
  has_many :followers
  has_many :tracks

end