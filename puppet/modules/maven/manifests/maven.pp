class maven (
  $maven_home = "/usr/lib/maven",
  $maven_archive = "apache-maven-3.2.5-bin.tar.gz",
  $maven_folder = "apache-maven-3.2.5") {
  
  
  exec {
      path => [ "/usr/bin", "/bin", "/usr/sbin"]
  }
  
  exec { "download maven":
	  cwd => "/vagrant/puppet/modules/maven/files",	
	  command => "wget -c http://apache.mirror.anlx.net/maven/maven-3/3.2.5/binaries/${maven_archive}",
	  logoutput => on_failure,
	  creates => "/vagrant/puppet/modules/maven/files'${archive}'",
	  user => root,
}
  exec { "extract maven":
      cwd => "/vagrant/puppet/modules/maven/files",
	  command => "tar xfv ${maven_archive}",
      creates => "${maven_home}",
      require => Exec["download maven"],
  }

  exec { "move maven":
      command => "mv ${maven_folder} ${maven_home}",
      creates => "${maven_home}",
      cwd => "/vagrant/puppet/modules/maven/files",
      require => Exec["extract maven"]
  }
  
  file { "/etc/profile.d/maven.sh":
      content =>   "export MAVEN_HOME=${maven_home}
                   export M2=\$MAVEN_HOME/bin
                   export PATH=\$PATH:\$M2
                   export MAVEN_OPTS=\"-Xmx512m -Xms512m\""
  }
}