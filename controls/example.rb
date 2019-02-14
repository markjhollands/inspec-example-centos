# encoding: utf-8
# copyright: 2018, The Authors

# Disallow insecure protocols by testing

# To run this remotely run a command such as:
# inspec exec . -t ssh://centos@34.212.241.130 -i C:\Users\chef\.ssh\id_rsa

describe package('telnetd') do
  it { should_not be_installed }
end
