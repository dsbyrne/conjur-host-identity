resource_name :conjurize

property :netrc_path,         String, :default: '/etc/conjur.identity'
property :account,            String, :required: true
property :appliance_url,      String, :required: true
property :host_identity,      String, :required: true
property :cert_path,          String
property :ssl_certificate,    String
property :host_factory_token, String

action :run do
    require 'fileutils'
    require 'yaml'

    # Verify certificate values
    use_existing_cert = cert_path.empty?
    if not use_existing_cert do
        cert_path = "/etc/conjur-#{account}.pem"

        raise "ssl_certificate must have value." if ssl_certificate.empty? 
    else
        raise "No certificate found at '#{cert_path}'" if not File.exists? cert_path
    end

    # Write conjur.identity
    chef_gem 'netrc'

    conjur_identity = Netrc.read('/etc/conjur.identity')
    conjur_identity["#{appliance_url}/authn"] = host_identity, api_key
    conjur_identity.save
    File.chmod(0600, '/etc/conjur.identity')

    # Write conjur.conf
    conjur_conf = {
        'account' => account,
        'appliance_url' => appliance_url,
        'cert_file' => cert_path
        'netrc_path' => netrc_path
    }

    File.write('/etc/conjur.conf', conjur_conf.to_yaml)
    File.chmod(0644, '/etc/conjur.conf')

    # Write certificate if needed
    if not use_existing_cert do
        File.write(cert_path, ssl_certificate)
        File.chmod(0644, cert_path)
    end
end