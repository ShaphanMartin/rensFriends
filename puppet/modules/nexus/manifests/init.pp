class nexus(
        $archive="nexus-2.11.1-01-bundle.tar.gz",
		$folder="/vagrant/puppet/modules/nexus/files/nexus-2.11.1-01",
)


{
	exec{'download_nexus':
			cwd => "/vagrant/puppet/modules/nexus/files",
			command => "/bin/wget -c http://download.sonatype.com/nexus/oss/$archive",
			user => root,
	}

	exec{'extract_nexus':
	cwd => "/vagrant/puppet/modules/nexus/files",
	command => "/bin/tar xvzf $archive",
	require => Exec['download_nexus'],
	
	}
	
	
	
	
	#exec {'copy_nexus':
	
	#cwd => "/vagrant/puppet/modules/nexus/files",
	#command => "/usr/bin/cp $folder /usr/local",
	
	#require => Exec['extract_nexus'],
	#}
	
	 exec{'install':
			cwd => "/vagrant/puppet/modules/nexus/files",
			command => "/usr/bin/sudo ln -s nexus-2.11.1-01 nexus",
			user => root,
			#require => Exec['copy_nexus'],
	}
	
}
