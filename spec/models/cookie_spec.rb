require 'rails_helper'

describe Cookie do
  subject { Cookie.new }

  describe "associations" do
    it { is_expected.to belong_to(:storage) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:storage) }
  end

  describe 'before_create' do
    let(:cookie) { create(:cookie) }

    it 'has a cooking status' do
      expect(cookie.cooking?).to be_truthy
    end
  end
end
