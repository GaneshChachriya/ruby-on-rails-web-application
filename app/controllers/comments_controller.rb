class CommentsController < ApplicationController
   def new
   end
   def create
   	@article = Article.find(params[:post_id])
    @comment = @article.comments.new(comment_params)
     if @comment.save
           flash[:notice] = "comment created successfully."
        redirect_to article_path(@article)
       else
        render 'new'
       end
   private
        def comment_params
           params.require(:comment).permit(:body)
         end
end