describe CookCookieService do
  let(:cookie) { create(:cookie) }

  describe '#call' do
    it 'has to update the status to ready' do
      CookCookieService.call(cookie)

      expect(cookie.ready?).to be_truthy
    end
  end
end
