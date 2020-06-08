describe CookSheetCookiesService do
  let(:oven) { create(:oven) }
  let(:params) { { amount: 2, fillings: 'My fillings' } }

  describe '#call' do
    it 'has to create 2 new cookies for the given oven' do
      CookSheetCookiesService.call(oven, params)

      expect(oven.cookies.count).to be(2)
    end
  end
end
