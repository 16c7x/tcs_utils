# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include tcs_utils::fact_migration
class tcs_utils::fact_migration {

  $bu = hiera('bu')
  $env = hiera('class')
  $classes = hiera('classes')
  $location = hiera('location')
  $patch_release = hiera('patch_release')

    file { ['/etc/facter/', '/etc/facter/facts.d']:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

    file { '/etc/facter/facts.d/tcs.yaml':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => epp('tcs_utils/migrated_facts.epp', {
        'bu'            => $bu,
        'env'           => $env,
        'classes'       => $classes,
        'location'      => $location,
        'patch_release' => $patch_release,
        }),
    }
}
