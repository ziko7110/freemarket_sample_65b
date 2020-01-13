require 'rails_helper'
# before_action :article_owner?, only: [:edit]
describe ItemsController, type: :controller do


  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: {  id: 1 }
      expect(response).to render_template :show
    end
  end
  
  
  describe 'GET #index' do

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  end


  describe 'GET #edit' do
    it "データが取れているか" do
      item = create(:item)
      get :edit, params: {id: item.id}
      expect(response).to be_success
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


# private
# def article_owner?
#   @item = Item.find(params[:id])
#   unless @item.user_id == current_user.id
#   end
# end