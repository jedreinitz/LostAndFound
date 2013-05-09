class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :description, :is_lost, :user

  validates :name, :presence => true
  validates :is_lost, :presence => true
end
