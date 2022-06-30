plan tcs_utils::migration(
  TargetSpec $targets,
){
  return run_task('tcs_utils::sudo_perms', $targets)

  apply_prep($targets)
  apply($target) { notify { foo: } }

  apply($targets) {
    file {'/tmp/role_base_linux.txt':
      ensure => file,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/tcs_utils/role_base_linux.txt',
    }
  }
}

