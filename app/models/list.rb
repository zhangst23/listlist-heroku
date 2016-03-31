require 'elasticsearch/model'
class List < ActiveRecord::Base
	belongs_to :author, class_name: "User", foreign_key: "user_id"
	belongs_to :node

	include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping dynamic: false do
    	indexes :title
    end


    def self.search(search)
    	response = __elasticsearch__.search(search)
    end


    def as_indexed_json(options={})
    	self.as_json(
    		only: [:id, :title, :content],
    		includes: [:title]

    	)
    end




end


