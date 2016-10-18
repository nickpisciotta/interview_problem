require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    it 'responds with a 200' do
      user_one = create_first_user

      get :show, id: user_one.id

      expect(response).to have_http_status(:ok)
    end
  end
end
