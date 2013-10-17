class Step < ActiveRecord::Base
  attr_accessible :description, :howto_id, :name
  belongs_to :howto
end
