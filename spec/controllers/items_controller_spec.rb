require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #index' do
    # it "populates an array of items ordered by id DESC" do
    #   binding.pry
    #   items = create_list(:item, 3)
    #   photos = create_list(:photo, 3)
    #   items = items.joins(:photos).group("item_id")
    #   get :index
    #   expect(assigns(items)).to match(items.sort{ |a, b| b.id <=> a.id } )
    # end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  end

end