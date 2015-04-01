require 'buildar/packer/template'

RSpec.describe Buildar::Packer::Template do
  let(:component_stub) { double(to_hash: {'key' => 'value'}) }
  subject {  described_class.new(provisioners: [component_stub], builders: []) }

  describe '#serialize' do
    it 'yields valid JSON' do
      expect { JSON.parse(subject.serialize) }.not_to raise_error
    end

    it 'includes the component hash' do
      expect(JSON.parse(subject.serialize)['provisioners']).to include(component_stub.to_hash)
    end

    it 'does not include empty component groups' do
      expect(subject.serialize).not_to match(/builders/)
    end
  end
end
