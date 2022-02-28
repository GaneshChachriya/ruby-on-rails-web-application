class UsersController < ApplicationController
     before_action :set_user, only: [:show, :edit, :update, :destroy]
     before_action :require_user, only: [:edit, :update]
     before_action :login_required, only: [:edit, :update, :destroy]

    def new
        @user = User.new
    end
    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end
    def edit 
    end
    def show 
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end
    def update 
        if @user.update(user_params)
            flash[:notice] = "your account is successfully updated"
            redirect_to @user
        else
            render 'edit'
        end
    end    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "welcome to the Alphablog #{@user.username}, you successfully signup"
            redirect_to articles_path
        else
            render 'new'
        end
        
        def destroy
          @user.destroy
          session[:user_id] = nil
          flash[:notice] = "Account and all associated articles successfully deleted"
          redirect_to articles_path
        end
    end
        private 
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
        def set_user
            @user = User.find(params[:id])
        end
        def login_required
            if current_user != @user
                flash[:alert] = "you can only edit you update your profile"
                redirect_to @user
            end 
        end

end