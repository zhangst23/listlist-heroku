class CommentsController < ApplicationController
  before_action :set_list

  def index
  	@comments = @list.comments.order('created_at DESC')
  end

  def create
  	@comment = @list.comments.create(comment_params)
  	# @comment.user_id = current_user.id

  	if @comment.save
  		respond_to do |format|
  			format.html { redirect_to list_path(@list)  }
  			format.js
  		end
  	else
      flash[:alert] = 'Check the comment form, something went wrong.'
      render root_path
    end
  end


  def destroy
    @comment = @list.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
