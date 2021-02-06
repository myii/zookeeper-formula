# frozen_string_literal: true

control 'zookeeper command to test server running in non-error state' do
  title 'should match desired outputs'

  # https://zookeeper.apache.org/doc/r3.1.2/zookeeperAdmin.html#sc_zkCommands
  describe command('echo ruok | nc localhost 2181') do
    its(:stdout) { should eq("imok") }
    its(:stderr) { should be_empty }
  end
end
