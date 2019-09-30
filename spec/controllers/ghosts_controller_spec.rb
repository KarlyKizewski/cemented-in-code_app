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

    it "should properly deal with validation errors" do
      post :create, params: { ghost: { person: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Ghost.count).to eq 0
      post :create, params: { ghost: { eulogy: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Ghost.count).to eq 0
    end
  end

  describe "ghosts#show action" do
    it "should successfully show the page if the ghost is found" do
      ghost = FactoryBot.create(:ghost)
      get :show, params: { id: ghost.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the ghost is not found" do
      get :show, params: { id: 'silly' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
