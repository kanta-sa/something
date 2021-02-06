require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user_id: user.id) }
  subject { category }

  describe 'validation' do
    it 'category valid data' do
      is_expected.to be_valid
    end
  end
end
