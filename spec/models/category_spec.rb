require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }
  subject { category }

  describe 'validation' do
    it 'category valid data' do
      is_expected.to be_valid
    end

    it 'necessary name column' do
      category.name = ''
      is_expected.not_to be_valid
    end

    it 'too long name' do
      category.name = 'a' * 21
      is_expected.not_to be_valid
    end
  end

  describe 'associations' do
    it 'category can make some todos' do
      category.todos.create(attributes_for(:todo))
    end
  end
end
