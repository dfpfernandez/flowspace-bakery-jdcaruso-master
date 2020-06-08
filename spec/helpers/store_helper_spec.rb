describe StoreHelper do
  describe '#fillings_text' do
    context 'with filling argument' do
      it 'has to return this filling text' do
        expect(helper.fillings_text('this filling')).to eq('this filling')
      end
    end

    context 'with an empty string as argument' do
      it 'has to return this filling text' do
        expect(helper.fillings_text('')).to eq(Cookie::EMPTY_FILLING_TEXT)
        expect(helper.fillings_text(' ')).to eq(Cookie::EMPTY_FILLING_TEXT)
      end
    end

    context 'with nil as argument' do
      it 'has to return this filling text' do
        expect(helper.fillings_text(nil)).to eq(Cookie::EMPTY_FILLING_TEXT)
      end
    end
  end
end
