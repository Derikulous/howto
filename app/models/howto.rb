class Howto < ActiveRecord::Base
  has_many :steps
  attr_accessible :name, :description

  accepts_nested_attributes_for :steps
end
