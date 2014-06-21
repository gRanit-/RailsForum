class UsersController < ApplicationController
    
    def new_user
        @user=User.new
    end

    def new_user_create
    end

    def delete_user
    end

    def destroy_user
    end
  private
        def user__params
            params.require(:user).permit(:email, :encrypted_password,:nick)
        end
end
