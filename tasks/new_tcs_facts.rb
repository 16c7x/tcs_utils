#!/opt/puppetlabs/puppet/bin/ruby
# frozen_string_literal: true

require 'json'
require 'puppet'
require 'yaml'

def new_tcs_facts(bu, environment, classes, location, patchrelease)
 config = {}
 config['bu'] = bu
 config['class'] = environment
 config['classes'] = classes
 config['location'] = location
 config['patchrelease'] = patchrelease
 File.open('/etc/facter/facts.d/tcs.yaml','w') do |h| 
  h.write config.to_yaml
 end
end

params = JSON.parse(STDIN.read)
bu = params['bu']
environment = params['environment']
classes = params['classes']
location = params['location']
patchrelease = params['patchrelease']
config = {}

begin
 result = new_tcs_facts(bu, environment, classes, location, patchrelease)
 puts result
 exit 0
rescue Puppet::Error => e
 puts(status: 'failure', error: e.message)
 exit 1
end
