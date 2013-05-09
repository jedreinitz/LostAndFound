class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :is_lost, :name, :user
end
