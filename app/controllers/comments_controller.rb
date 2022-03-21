class CommentsController < ApplicationController
   before_action :require_user
   def new
      @article = Article.find(params[:article_id])
    @comment = @article.comments.new(parent_id: params[:parent_id])
   end
   def create
   	     @article = Article.find(params[:article_id])
           @comment = @article.comments.new(comment_params)
           if @comment.save
              flash[:notice] = "comment created successfully."
              redirect_to article_path(@article)
           end
   end
         private
           def comment_params
             params.require(:comment).permit(:body)
           end 
end