require 'elasticsearch/model'
class List < ActiveRecord::Base
    acts_as_votable

	belongs_to :author, class_name: "User", foreign_key: "user_id"
	belongs_to :node
    belongs_to :user
    has_many :comments, dependent: :destroy


    # validates :user_id, presence: true
    #   validates :image, presence: true
    #   validates :caption, length: { minimum: 3, maximum: 300 }

    #   has_attached_file :image, styles: { :medium => "640x" }
    #   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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


