class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_create_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_update_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    
    def user_create_params
      params.require(:user).permit([:username, :password, :password_confirmation, :email, :name, :birthdate])
    end
    
    def user_update_params
      params.require(:user).permit([:username, :email, :name, :birthdate, :relationship_status, :relationship_type,
                                    :longest_relationship, :height, :body_type, :hair_color, :eye_color, :diet,
                                    :smoking, :drinking, :drugs, :religion, :religion_importance, :zodiac_sign,
                                    :education, :education_status, :ambitiousness, :has_children, :wants_children,
                                    :catch, :summary, :current_life, :free_time, :favorite, :most_important, :talk_more,
                                    :gender_interest, :age_min, :age_max, :desire_single, :desire_near, :ethnicity => [],
                                    :relationship_interest => []])
    end
end
