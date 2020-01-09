require 'rails_helper'

describe ItemsController, type: :controller do
  
  describe 'GET #index' do

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  end


  describe 'DELETE #destroy' do

    it "deletes the item" do
      item = create(:item)
      expect{
        delete :destroy, params: { id: item }
      }.to change(Item,:count).by(-1)
    end

  end

end