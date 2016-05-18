# @restful_api 1.0
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # @url /users
  # @action GET
  #
  # View list of all users
  #
  # @response [Array<User>] List of users
  def index
    @users = User.all

    render json: @users, each_serializer: SimpleUserSerializer
  end

  # @url /users/:id
  # @action GET
  #
  # View a user
  #
  # @required [Integer] id Identifier the user
  #
  # @response [User] The requested user
  def show
    render json: @user, serializer: CompleteUserSerializer
  end

  # @url /users
  # @action POST
  #
  # Create a new user
  #
  # @required [String] username The username of the user
  # @required [String] password The desired password of the user
  # @required [Integer] password_confirmation Confirmation of the password
  # @required [String] email The email of the user
  # @required [String] name The name of the user
  # @required [Date] birthdate When the user was born
  #
  # @response [User] The created user
  #
  # @example_request_description A valid request
  # @example_request
  #  ```json
  #  {
  #    "user": {
  #      "username": "amykun",
  #      "password": "amy",
  #      "password_confirmation": "amy",
  #      "email": "amy@domain.com",
  #      "name": "Amy",
  #      "birthdate": "1990-7-4T00:00:00.000Z"
  #    }
  #  }
  #  ```
  def create
    @user = User.new(user_create_params)

    if @user.save
      render json: @user, status: :created, location: @user, serializer: CompleteUserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # @url /users/:id
  # @action PATCH
  #
  # Update a user
  #
  # @required [Integer] id The id of the User
  # @required [String] username The username of the User
  # @required [String] email The email of the User
  # @required [String] name The name of the User
  # @required [Date] birthdate When the User was born
  # @required [String[]] ethnicity The ethnicity of the User
  # @required [Integer] relationship_status The relationship status of the User
  # @required [Integer] relationship_type The relationship type of the User
  # @required [Integer] longest_relationship The longest relationship of the User
  # @required [Integer] height The height of the User
  # @required [Integer] body_type The body type of the User
  # @required [Integer] hair_color The hair color of the User
  # @required [Integer] eye_color The eye color of the User
  # @required [Integer] diet The diet of the User
  # @required [Integer] smoking How often the User smokes
  # @required [Integer] drinking How often the User drinks
  # @required [Integer] drugs How often the User does drugs
  # @required [Integer] religion The religion of the User
  # @required [Integer] religion_importance How important the User's religion is to them
  # @required [Integer] zodiac_sign The zodiac sign of the User
  # @required [Integer] education The level of education of the user
  # @required [Integer] education_status The education status of the User
  # @required [Integer] ambitiousness How ambitious the User is
  # @required [Boolean] has_children The has children of the User
  # @required [Integer] wants_children The User's desire to have children
  # @required [String] catch The User's short phrase to catch a potential matche's attention
  # @required [String] summary The summary of the User
  # @required [String] current_life What the User is doing currently in their life
  # @required [String] free_time What the User does in their free time
  # @required [String] favorite The favorite things of the User
  # @required [String] most_important The most important things to the User
  # @required [String] talk_more A potential match should message the User if
  # @required [Integer] gender_interest The genders that the User is interested in
  # @required [Integer] age_min The minimum age the User wants to match with
  # @required [Integer] age_max The maximum age the User wants to match with
  # @required [Boolean] desire_single Whether or not the User desires matches that are single
  # @required [Boolean] desire_near Whether or not the User desires matches near to them
  # @required [String[]] relationship_interest The User's relationship interests
  #
  # @response [User] The updated user
  #
  # @example_request_description A valid request
  # @example_request
  #  ```json
  #  {
  #    "user": {
  #      "username": "amykun",
  #      "email": "amy@domain.com",
  #      "name": "UPDATED Amy",
  #      "birthdate": "1990-7-4T00:00:00.000Z",
  #      "ethnicity": ["white", "asian"],
  #      "relationship_status": 0,
  #      "relationship_type": 0,
  #      "longest_relationship": 0,
  #      "height": 155,
  #      "body_type": 1,
  #      "hair_color": 2,
  #      "eye_color": 2,
  #      "diet": 1,
  #      "smoking": 2,
  #      "drinking": 1,
  #      "drugs": 2,
  #      "religion": 0,
  #      "religion_importance": 0,
  #      "zodiac_sign": 1,
  #      "education": 0,
  #      "education_status": 0,
  #      "ambitiousness": 2,
  #      "has_children": false,
  #      "wants_children": 2,
  #      "catch": "I'm not as cool as Chris",
  #      "summary": "Nothing special about me",
  #      "current_life": "Forever alone",
  #      "free_time": "I don't have free time",
  #      "favorite": "Favorite all the things",
  #      "most_important": "Everything is important",
  #      "talk_more": "Just message me you panzee",
  #      "gender_interest": 1,
  #      "age_min": 22,
  #      "age_max": 25,
  #      "desire_single": true,
  #      "desire_near": true,
  #      "relationship_interest": ["new friends", "casual sex"]
  #    }
  #  }
  #  ```
  def update
    if @user.update(user_update_params)
      render json: @user, serializer: CompleteUserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # @url /users/:id
  # @action DELETE
  #
  # Delete a user
  #
  # @required [Integer] id The id of the User
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
                                    :gender_interest, :age_min, :age_max, :desire_single, :desire_near, :tag_list,
                                    ethnicity: [], relationship_interest: []])
    end
end
