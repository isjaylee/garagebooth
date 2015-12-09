require "rails_helper"

describe BoothsController do
  
  describe "when not logged in" do
    before :each do
      @booth = FactoryGirl.create(:booth)
      post :create, { booth_id: @booth.id }
    end

    specify { should redirect_to new_user_session_path }
    specify { expect(session['warden.user.user.key']).to be_nil }
  end

  describe "when logged in" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "#index" do
      it "should renders homepage" do
        get :index
        expect(response.status).to eq(200)
        expect(subject).to render_template(:index)
      end
    end

    describe "#create" do
      describe "with valid params" do
        before :each do
          @valid_params = { name: "ABC",
                            address1: "123 Main St",
                            city: "Maplewood",
                            state: "MN",
                            zipcode: "55109",
                            start_date: "2015/01/01",
                            stop_date: "2015/01/05",
                            email: @user.email }
        end

        it "should create a new booth" do
          expect {
            post :create, { booth: @valid_params }
          }.to change{Booth.count}.by(1)
          expect(assigns(:booth)).to be_a(Booth)
          expect(assigns(:booth)).to be_persisted
          expect(subject).to redirect_to booth_path(Booth.last)
        end
      end

      describe "with invalid params" do
        before :each do
          @invalid_params = { name: "ABC" } 
        end

        it "should not create a new booth" do
          expect {
            post :create, { booth: @invalid_params }
          }.to change{Booth.count}.by(0)
          expect(subject).to render_template(:new)
        end
      end
    end
  end
  
end