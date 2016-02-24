#
# Copyright 2014, Kevin Gilpin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Alternatively, package 'ruby-devel'
# case node.platform_family
# when 'rhel'
#   package 'rubygem-json'
# else
#   package 'ruby-json'
# end

# chef_gem 'conjur-cli'
# chef_gem 'conjur-asset-host-factory'

# appliance_url = node.conjur.configuration.appliance_url
# account = node.conjur.configuration.account
# netrc_path = node.conjur.configuration.netrc_path
# cert_file = "/etc/conjur-#{account}.pem"

# ConjurHelper.update_config(node) do |conjur_config|
#   conjur_config['appliance_url'] = appliance_url
#   conjur_config['account'] = account
#   conjur_config['netrc_path'] = netrc_path
# end

# if File.exist?(cert_file)
#   File.chmod 0644, cert_file
#   ConjurHelper.update_config(node) do |conjur_config|
#     conjur_config['cert_file'] = cert_file
#   end
# end

# # Store the Conjur SSL certificate coming in a string
# if node.conjur.configuration['ssl_certificate']
#   require 'fileutils'
#   File.write(cert_file, node.conjur.configuration.ssl_certificate)
#   File.chmod 0644, cert_file
#   ConjurHelper.update_config(node) do |conjur_config|
#     conjur_config['cert_file'] = cert_file
#   end
# end

# # Configure the Conjur client using the config we've just written.
# ConjurHelper.configure! node

# # Create the host identity if it doesn't exist.
# unless ConjurHelper.credentials?
#   require 'uri'
#   require 'conjur-asset-host-factory'

#   Chef::Log.debug "Conjur host identity not found in #{ConjurHelper.netrc_file}"
  
#   token   = node.conjur.host_factory_token
#   host_id = node.conjur.host_identity.id

#   Chef::Log.info "Creating Conjur host identity '#{host_id}'"

#   host = Conjur::API.host_factory_create_host token, host_id
  
#   ConjurHelper.save_credentials [ "host/#{host['id']}", host['api_key'] ]
# else
#   Chef::Log.debug "Conjur host identity already exists in #{ConjurHelper.netrc_file}"
# end

conjurize 'host-identity' do
  ssh true
  overwrite true
  account 'demo'
  appliance_url 'https://ec2-54-145-99-94.compute-1.amazonaws.com/api'
  host_identity 'test10'
  host_factory_token '146sv1k275pd1g33cnx61jrvmrh1q9a0sj2rjwjwh1nxjjgq10dr1yz'
  ssl_certificate '-----BEGIN CERTIFICATE-----
MIIDkDCCAnigAwIBAgIUdajAtfm2sSDEkMdq8K9/+Lqk0aowDQYJKoZIhvcNAQEL
BQAwVjENMAsGA1UEChMEZGVtbzESMBAGA1UECxMJQ29uanVyIENBMTEwLwYDVQQD
EyhlYzItNTQtMTQ1LTk5LTk0LmNvbXB1dGUtMS5hbWF6b25hd3MuY29tMB4XDTE2
MDIyNDE1NDg1M1oXDTI2MDIyMTE1NDg1M1owMzExMC8GA1UEAwwoZWMyLTU0LTE0
NS05OS05NC5jb21wdXRlLTEuYW1hem9uYXdzLmNvbTCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAMYoDuq90vKJoPrkgUxBz0jZLLmGDLb/X/YeWUX5KpED
mlRuflZ1GC/vE/men3Ex0vdEzKgzCz993N0Dg8p2rkpyIp+4uRdb95+mzO+zbI5m
v355jHimeG5y5TF3qbfNTPxCbNVPhVvoDeRH+JImL2lQ8xbeRM+0ZxJzDrSwNwbR
KWAPJlNuR/iT6++e1LfjQOQK4enk8CIDsOyRc2SHuzOSrlxfnK5daxQOkgWfNk61
AdFWvd5pEvOx8O3c3gA0ZtokQVIRdGyUxdzF9FQ0narB8onZDfMNmYnrs63Q75HC
Q5TOfLNljJr2YK+AcJq4CFM2RiSq96YU4h9Ocne+pLcCAwEAAaN5MHcwDgYDVR0P
AQH/BAQDAgWgMB0GA1UdDgQWBBTaOaPuXmtLDTJVv++VYBiQr9gHCTBGBgNVHREE
PzA9gihlYzItNTQtMTQ1LTk5LTk0LmNvbXB1dGUtMS5hbWF6b25hd3MuY29tggls
b2NhbGhvc3SCBmNvbmp1cjANBgkqhkiG9w0BAQsFAAOCAQEAmKbJ2vlOSoivHhNU
BzmbsnWMxasKwuNiTQlxSPnzHfXl+bqwCUtVCMpUjhlwLc1RumhLdFKH9tjvlGiM
tI9pmGa8lPa5vH8HqFnEWSfGA9uC7eTW9OHgTOR/MOlmJ8djfYCABIPIegdRJbFG
PJj+5fbhNv9QAbV81fkxhBu6ou1C2HQh3+LGD6SO9hn1+h+UBCF/peE4iptB5RNW
sxoNAthY4OEY4cTes90IbIurc0Tf1PIgrMfAsG0qFspjxClk1Q5jeIEVwzNHrQrQ
yTeFmw1Vo+jwPQ2Zx6lU6lp816cT1sFDFZjJGXDGduxCslsfGYB3idI1Rs5LU0AE
7y3K5w==
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIID1jCCAr6gAwIBAgIJANg+ADjkFDm7MA0GCSqGSIb3DQEBCwUAMFYxDTALBgNV
BAoTBGRlbW8xEjAQBgNVBAsTCUNvbmp1ciBDQTExMC8GA1UEAxMoZWMyLTU0LTE0
NS05OS05NC5jb21wdXRlLTEuYW1hem9uYXdzLmNvbTAeFw0xNjAyMjQxNTQ4NDha
Fw0yNjAyMjExNTQ4NDhaMFYxDTALBgNVBAoTBGRlbW8xEjAQBgNVBAsTCUNvbmp1
ciBDQTExMC8GA1UEAxMoZWMyLTU0LTE0NS05OS05NC5jb21wdXRlLTEuYW1hem9u
YXdzLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALAY0+aQhEJb
/HYiEQj5ML3cizhhwOmDLGwm3+mbtHH3OQgOgVhZHecOVd3gU9Nn+vF3959S3Gsk
tiv9SmF+2flflSroc7NVJZWRPodbBodfik9Ad+gqCNTlF79XorNR+I//vU2TmBU3
RY3yk0KlfSA9InPeiVcbvdbVwZmJ7fk9zsFOWx/FRu1WO5ZG7j4Tu0uUmaggWwZn
Jra0LjZjzzWdOdLwVmwAUqTB11bV++yISAaVhjLEUqQOZV7WC6ORdqv/Efod6IRZ
90vDLtUU9pdSH+ah3Df0esq8bJjC3wqRc8U7liMeoSxwNeKyywis69pr8i6x+snb
/hL23XjHhA8CAwEAAaOBpjCBozBGBgNVHREEPzA9gihlYzItNTQtMTQ1LTk5LTk0
LmNvbXB1dGUtMS5hbWF6b25hd3MuY29tgglsb2NhbGhvc3SCBmNvbmp1cjAdBgNV
HQ4EFgQUe7mZCGdNynqzcwNblTpL1nKcrG8wHwYDVR0jBBgwFoAUe7mZCGdNynqz
cwNblTpL1nKcrG8wDAYDVR0TBAUwAwEB/zALBgNVHQ8EBAMCAeYwDQYJKoZIhvcN
AQELBQADggEBAH3AGjl8irRVPjUNMCrpEF3DZvjjH1NpG6HdBmyi/9ORTL8kNgSL
wSFRGX6SsARuutJj9FY27uZZmDeWW0GxM6EEUDPJHrWhhWSX0NuTdC8z5E3+DYxc
no8eCl691fCnrRiLAVYVYisge0d4ofJWhdaP0vJLRwYLkrSOvTnfTJ78Cqttf0ZO
9hKXuNIpAh98vpi01UuG3+8KNpJ533QDCKXzW7Mo76MK5kfvmplbA2Pkf6TRIDFC
csFK4DSymGL7BRxb3itQuFOqmcX3K+J95KMBFiJaR2+pzOXzWRplydsGp35RJ2aL
M8ixA1TcX+6Gf7a0fXFpUEOQACEPI09FkTA=
-----END CERTIFICATE-----'
end
