describe ApplicationService do
  describe '.call' do
    it 'has to respond to call method' do
      expect(subject.class).to respond_to(:call).with_unlimited_arguments
    end
  end
end
