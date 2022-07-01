plan module2::migration(
  TargetSpec $targets,
){
  run_task('module2::sudo_perms', $targets)

  apply_prep($targets)

  apply($targets) {
    file {'/tmp/role_base_linux.txt':
      ensure => file,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/module2/role_base_linux.txt',
    }

    file {'/tmp/exclusions.txt':
      ensure => file,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/module2/exclusions.txt',
    }
  }

  run_task('module2::get_run_data', $targets)
  run_task('module2::exclusions', $targets)
  run_task('module2::run_diff', $targets)

}

