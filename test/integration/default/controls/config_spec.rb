# frozen_string_literal: true

control 'zookeeper configuration' do
  title 'should match desired lines'

  describe file('/opt/zookeeper-3.6.2/conf/zoo.cfg') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    its('content') do
      should include <<~ZOO_CFG
        ########################################################################
        # File managed by Salt at <salt://zookeeper/files/default/zoo.tmpl.jinja>.
        # Your changes will be overwritten.
        ########################################################################
        tickTime=2000
        dataDir=./state/zookeeper
        initLimit=5
        syncLimit=2
        4lw.commands.whitelist=*
        clientPort=2181
      ZOO_CFG
    end
  end
end
