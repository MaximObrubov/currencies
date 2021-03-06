require 'rails_helper'

RSpec.describe IndexController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
    
    it "renders the index template" do
      get :admin
      expect(response).to render_template(:admin)
    end
  end
end
