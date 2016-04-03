module ListsHelper
  def display_likes(list)
  	votes = list.votes_for.up.by_type(User)
  	count_likers(votes)
  end

  def liked_list(list)
  	return 'fi-heart' # if current_user.voted_for? list
  	'fi-heart'
  end



	private

	def list_likers(votes)
		names = []
		unless votes.blank?
			votes.voters.each do |voter|
				names.push(link_to voter.name,
								   profile_path(voter.name),
								   class: 'name')
			end
			names.to_sentence.html_safe + like_plural(votes)
		end
	end


	def count_likers(votes)
		vote_count = votes.size
		vote_count.to_s + ' 感谢'
	end

	def like_plural(votes)
		return ' 感谢' if votes.count > 1
		' 感谢'
	end

end











