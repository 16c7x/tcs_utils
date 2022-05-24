#!/opt/puppetlabs/puppet/bin/ruby
# frozen_string_literal: true

require 'json'
require 'puppet'
require 'yaml'

def update_patch_release(patchrelease)
  config = YAML.load_file('/etc/facter/facts.d/tcs.yaml')
  if config['patchrelease'] != patchrelease
    message = "Changing patchrelease #{config['patchrelease']} to #{patchrelease}"
    config['patchrelease'] = patchrelease
    File.open('/etc/facter/facts.d/tcs.yaml','w') do |h| 
      h.write config.to_yaml
    end
  end
end

params = JSON.parse(STDIN.read)
patchrelease = params['patchrelease']

begin
 result = update_patch_release(patchrelease)
 puts result
 exit 0
rescue Puppet::Error => e
 puts(status: 'failure', error: e.message)
 exit 1
end