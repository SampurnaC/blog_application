class ProfilesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @profile=current_user.profile
        @posts=Post.includes(:user).where(user_id: current_user)

    end

    def new
        @profile = Profile.new
    end
    def edit
        @profile = Profile.find(params[:id])

    end

    def update
        @profile = Profile.find(params[:id])
        if @profile.update(profile_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def create
        if @profile.nil?
            @profile = Profile.create(profile_params)

            # @profile=Profile.create_or_update(profile_params)
            @profile.user_id=current_user.id
            @profile.save!
            # @profile = current_user.profile.create(profile_params)
        else
            @profile = Profile.update(profile_params)
        end
        redirect_to root_path
    end

    private
    def profile_params
        params.require(:profile).permit(:name, :bio)
    end

end
