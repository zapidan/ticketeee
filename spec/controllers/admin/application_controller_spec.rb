require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before do 
    allow(controller).to receive(:authenticate_user!) # stub call and return nil by default
    allow(controller).to receive(:current_user).and_return(user) # stub current_user method call
  end
  
  context "non-admin users" do
    it "are not able to access the index action" do
      get :index

      expect(response).to redirect_to "/"
      expect(flash[:alert]).to eq "You must be an admin to do that."
    end
  end
end
