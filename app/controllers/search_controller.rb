class SearchController < ApplicationController


	def search
		if params[:q].nil?
			@lists = []
		else
			@lists = List.search(
				query: {
					multi_match: {
						query: params[:q].to_s,
						fields: ['title']
					}
				}
			).records
		end
	end



end
