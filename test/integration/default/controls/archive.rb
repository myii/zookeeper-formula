# frozen_string_literal: true

control 'zookeeper archive' do
  title 'directory and files should be available'

  describe file('/opt/zookeeper-3.6.2/') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0755' }
  end

  %w[
    zkEnv.sh
    zkCli.sh
    zkServer.sh
    zkServer-initialize.sh
    zkTxnLogToolkit.sh
    zkSnapShotToolkit.sh
    zkCleanup.sh
  ].each do |f|
    describe file("/opt/zookeeper-3.6.2/bin/#{f}") do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'root' }
      it { should be_executable }
      its('mode') { should cmp '0755' }
    end
  end
end

