require 'rails_helper'

RSpec.describe 'Shops', type: :request do
  let(:category) { attributes_for(:category) }
  let(:todo) { attributes_for(:todo) }
  let(:user) { create(:user) }

  describe 'POST /categories' do
    context 'present todos_attributes params' do
      before do
        category['todos_attributes'] = { '0': todo }
      end
      it 'request success' do
        post categories_path, params: category
        expect(response.status).to eq 302
      end

      it '#create' do
        category['user_id'] = user.id
        expect do
          user.categories.create!(category)
        end.to change(Category, :count).by(1) and change(Todo, :count).by(1)
      end
    end
  end
end
