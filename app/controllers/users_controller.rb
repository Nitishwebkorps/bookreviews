class UsersController < ApplicationController
   
    def index 
        @users =User.all
        
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:role))
          flash[:success]="Profile is updated successfully" 
          redirect_to users_path(@user)
        else
          render 'edit'
        end
    end

    def show
      @user = User.find(params[:id])
      @k=@user.books    
    end    

   

end