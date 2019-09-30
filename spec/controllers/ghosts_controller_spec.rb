require 'rails_helper'

RSpec.describe GhostsController, type: :controller do
  describe "ghosts#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "ghosts#new action" do
    it "should successfully show the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "ghosts#create action" do
    it "should successfully create a new ghost in our database" do
      post :create, params: { ghost: { person: 'person', eulogy: 'rest in peace' } }
      expect(response).to redirect_to root_path
      ghost = Ghost.last
      expect(ghost.person).to eq('person')
      expect(ghost.eulogy).to eq('rest in peace')
    end
  end
end
