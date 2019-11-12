class LoginController < ApplicationController
    def main
    end

    def new
    end

    def create
        @user = User.find_by(uid: session_params[:uid], pass: session_params[:pass])

        if @user
            redirect_to login_main_url, notice:'ログインしました！'
        else
            render :login
        end
    end
    
    def destroy
        reset_session
        redirect_to root_url, notice:'ログアウトしました！'
    end

    private
    def session_params
        params.require(:session).permit(:uid, :pass)
    end
end
