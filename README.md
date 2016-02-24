conjur-host-identity
====================
The conjur-host-identity cookbook is a library cookbook that provides a conjurize resource for use in recipes.

Usage
-----
```ruby
conjurize 'host-identity' do
  account            node['conjur']['account']
  appliance_url      node['conjur']['appliance_url']
  host_identity      node['fqdn']
  host_factory_token node['service-host']['host_factory_token']
  ssl_certificate    node['conjur']['certificate']
  ssh                true
end
```

Attributes
----------
`account`  
Name of the account that Conjur was configured with
  
`appliance_url`  
URL to the Conjur appliance
  
`host_identity`  
The name of the host to be created
  
`host_factory_token`  
The host factory token to be used in exchange for a Conjur identity
  
`ssl_certificate`  
The contents of the SSL certificate to verify the Conjur server  
_or_  
The path to an existing certificate on disk
  
`ssh`  
If true, the machine will run the [Conjur cookbook](https://github.com/conjur-cookbooks/conjur), configuring the machine for SSH and audit logging.

`overwrite`  
If true, any existing identity on the machine will be overwritten.  
