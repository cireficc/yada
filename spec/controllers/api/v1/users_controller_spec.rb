require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  before {
    @chris = create(:chris)
  }

  it "should get index" do
    get :index
    assert_response(:success)
  end

  it "should create user if parameters valid" do
    @bob = User.new(username: "bob", birthdate: (18.years.ago - 1.day),
                    height: 160, age_min: 18, age_max: 99)
    params = {}
    params[:user] = @bob.attributes
    params[:user][:password] = "bob"
    params[:user][:password_confirmation] = "bob"

    expect { post(:create, params: params) }.to(change { User.count }.by(1))
    assert_response(201)
  end

  it "should not create user if parameters invalid" do
    @bob = User.new(username: "bob/", birthdate: 18.years.ago,
                    height: 301, age_min: 17, age_max: 100)
    expect { post(:create, params: { user: @bob.attributes }) }.to(change { User.count }.by(0))
    assert_response(:unprocessable_entity)
  end

  it "should show user" do
    get(:show, params: { id: @chris })
    assert_response(:success)
  end

  it "should update user if parameters valid" do
    patch(:update, params: { id: @chris, user: @chris.attributes })
    assert_response(200)
  end

  it "should not update user if parameters invalid" do
    @chris.username = nil
    patch(:update, params: { id: @chris, user: @chris.attributes })
    assert_response(:unprocessable_entity)
  end

  it "should destroy user" do
    expect { delete(:destroy, params: { id: @chris }) }
      .to(change { User.count }.by(-1))
    assert_response(204)
  end
end
