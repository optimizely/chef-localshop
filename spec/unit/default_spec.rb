require 'spec_helper'

describe 'localshop::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'sets up localshop' do
    expect(chef_run).to install_package('git')
    expect(chef_run).to create_user('nobody')
    expect(chef_run).to create_group('nogroup')

    expect(chef_run).to create_directory('/opt/localshop/shared/env').with(
      owner: 'nobody',
      group: 'nogroup',
      recursive: true
    )

    expect(chef_run).to deploy_application('localshop').with(
      path: '/opt/localshop',
      owner: 'nobody',
      group: 'nogroup',
      repository: 'git://github.com/mvantellingen/localshop.git',
      revision: 'd21912d09f00baab7f96e0e948167822f5c2a0ff',
      migrate: true
    )
  end
end
