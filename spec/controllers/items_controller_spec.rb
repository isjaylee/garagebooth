require "rails_helper"

describe ItemsController do
  
  describe "when not logged in" do
    before :each do
      @item = FactoryGirl.create(:item)
      post :create, { booth_uid: @item.booth.uid }
    end

    specify { should redirect_to new_user_session_path }
    specify { expect(session['warden.user.user.key']).to be_nil }

    describe "#new" do
      it "should redirect to login" do
        get :new, { booth_uid: @item.booth.uid, id: @item.id }
        expect(response.status).to eq(302)
        expect(subject).to redirect_to new_user_session_path
      end
    end

    describe "#create" do
      it "should redirect to login" do
        post :create, { booth_uid: @item.booth.uid, id: @item.id }
        expect(response.status).to eq(302)
        expect(subject).to redirect_to new_user_session_path
      end
    end

    describe "#edit" do
      it "should redirect to login" do
        get :edit, { booth_uid: @item.booth.uid, id: @item.id }
        expect(response.status).to eq(302)
        expect(subject).to redirect_to new_user_session_path
      end
    end

    describe "#update" do
      it "should redirect to login" do
        put :update, { booth_uid: @item.booth.uid, id: @item.id }
        expect(response.status).to eq(302)
        expect(subject).to redirect_to new_user_session_path
      end
    end

    describe "#show" do
      it "should render item show page" do
        get :show, { booth_uid: @item.booth.uid, id: @item.id }
        expect(response.status).to eq(200)
        expect(subject).to render_template(:show)
      end
    end
  end

  describe "when logged in" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
  end
end