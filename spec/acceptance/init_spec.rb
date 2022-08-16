# frozen_string_literal: true

require 'spec_helper_acceptance'

shared_examples 'kubectl version' do |v|
  describe command('kubectl version --client=true --output=json') do
    its(:exit_status) { is_expected.to eq(0) }

    it do
      expect(JSON.parse(subject.stdout)).to include(
        'clientVersion' => include(
          'gitVersion' => "v#{v}"
        )
      )
    end
  end
end

describe 'kubectl class' do
  context 'without any parameters' do
    include_examples 'the example', 'kubectl.pp'
    include_examples 'kubectl version', '1.24.3'
  end

  context 'with version => 1.24.0' do
    include_examples 'the example', 'kubectl_1_24_0.pp'
    include_examples 'kubectl version', '1.24.0'
  end
end
