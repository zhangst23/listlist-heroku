require 'redcarpet'

module ApplicationHelper

	def markdown(content)
	  @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
	  @markdown.render(content)
	end


	def profile_avatar_select(user)  
	  return image_tag user.avatar.url(:medium),
	                   id: 'image-preview',
	                   class: 'img-responsive img-circle profile-image' if user.avatar.exists?
	  image_tag 'default-avatar.jpg', id: 'image-preview',
	                                  class: 'img-responsive img-circle profile-image'
	end  



end
