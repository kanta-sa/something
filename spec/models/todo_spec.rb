require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:todo) { create(:todo) }
  subject { todo }

  describe 'validation' do
    it 'todo valid data' do
      is_expected.to be_valid
    end

    it 'necessary title column' do
      todo.title = ''
      is_expected.not_to be_valid
    end

    it 'necessary content column' do
      todo.content = ''
      is_expected.not_to be_valid
    end

    it 'too long title' do
      todo.title = 'a' * 21
      is_expected.not_to be_valid
    end

    it 'too long content' do
      todo.content = 'a' * 256
      is_expected.not_to be_valid
    end
  end
end
