describe file('/etc/logrotate.d/tomcat-myapp') do
  it { should be_a_file }
  its('mode') { should cmp '0644' }
  its('content') { should match(%r("/var/log/tomcat/myapp.log" {\s*daily\s*create 644 root adm\s*rotate 30)) }
end

describe file('/etc/logrotate.d/tomcat-myapp-multi-path') do
  it { should be_a_file }
  its('mode') { should cmp '0644' }
  its('content') { should match(%r("/opt/local/tomcat/catalina.out" {\s*daily\s*create 644 root adm\s*rotate 7)) }
end

describe file('/etc/logrotate.d/tomcat-myapp-no-enable') do
  it { should_not be_a_file }
end

describe file('/etc/logrotate.d/tomcat-myapp-custom-options') do
  it { should be_a_file }
  its('mode') { should cmp '0644' }
  its('content') { should include 'missingok' }
  its('content') { should include 'delaycompress' }
  its('content') { should include 'firstaction' }
end

describe file('/etc/logrotate.d/tomcat-myapp-custom-options-as-string') do
  it { should be_a_file }
  its('mode') { should cmp '0644' }
  its('content') { should include 'missingok' }
  its('content') { should include 'delaycompress' }
  its('content') { should include 'firstaction' }
end

describe file('/etc/logrotate.d/tomcat-myapp-custom-template') do
  it { should be_a_file }
  its('mode') { should cmp '0644' }
  its('content') { should include '# This is a custom template!' }
  its('content') { should include 'missingok' }
  its('content') { should include 'delaycompress' }
  its('content') { should include 'firstaction' }
end

describe file('/etc/logrotate.d/tomcat-myapp-sharedscripts') do
  its('content') { should include 'sharedscripts' }
end
