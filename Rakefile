desc "Package cookbooks into a chef-solo tarball"
task :package do
  `mkdir -p pkg`
  `mkdir -p vendor/cookbooks/conjur-host-identity-chef`
  `rsync --exclude .git --exclude pkg --exclude vendor -a . vendor/cookbooks/conjur-host-identity-chef`
  version=`git describe --tags --abbrev=0`.strip
  tarball = "conjur-host-identity-chef-#{version}.tar.gz"
  `rm -f pkg/#{tarball}`
  Dir.chdir 'vendor'
  puts "Building cookbook tarball #{tarball}"
  `tar czf ../pkg/#{tarball} cookbooks`
end
