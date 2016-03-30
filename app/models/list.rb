class List < ActiveRecord::Base
	belongs_to :author, class_name: "User", foreign_key: "user_id"
	belongs_to :node

end
