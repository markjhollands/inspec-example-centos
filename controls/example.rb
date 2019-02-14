# encoding: utf-8
# copyright: 2018, The Authors

# Disallow insecure protocols by testing

# To run this remotely run a command such as:
# inspec exec . -t ssh://centos@34.212.241.130 -i C:\Users\chef\.ssh\id_rsa

describe package('telnetd') do
  it { should_not be_installed }
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.6_Ensure_telnet_server_is_not_enabled" do
  title "Ensure telnet server is not enabled"
  desc  "
    The telnet-server package contains the telnet daemon, which accepts connections from users from other systems via the telnet protocol.

    Rationale: The telnet protocol is insecure and unencrypted. The use of an unencrypted transmission medium could allow a user with access to sniff network traffic the ability to steal credentials. The ssh package provides an encrypted session and stronger security.
  "
  impact 1.0
  describe bash("egrep \"^telnet\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end