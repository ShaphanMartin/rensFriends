class git::install(
        $module_path="/vagrant/puppet/modules/git/files/",
        $archive="v2.2.0.tar.gz",
		$git_home="/usr/local/",
		$git_name="git-2.2.0",
        
)	


{
	exec {'remove_older_versions':
		user => root,
		command => "/usr/bin/yum -y remove git-1.8.3.1",
		before => Exec['download_git'],
	}
	
	exec {'install_dependencies':
		command => "/usr/bin/yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker",
		user => root,
	}
	
	exec {'download_git':
		cwd => $module_path,
		command => "/usr/bin/wget -c https://github.com/git/git/archive/v2.2.0.tar.gz",
        creates => "$module_path$archive",
		require => Exec['install_dependencies']
	}
	exec {'extract_git':
		cwd => $git_home,
		command => "/bin/tar zxvf $module_path$archive",
		#logoutput => true,
		require => Exec['download_git'],	
	}
	exec {'make':
		cwd => "/usr/local/git-2.2.0",
		user => root,
		command => "/usr/bin/make",
		require => Exec['extract_git'],
	}
	
	exec {'make_git_prefix':
		cwd => "/usr/local/git-2.2.0",
		user => root,
		command => "/usr/bin/make prefix=../git-2.2.0/ all",
		require => Exec['make'],	
	}
	exec {'git_install':
		cwd => "/usr/local/git-2.2.0",
		user => root,
		command => "/usr/bin/make prefix=../git-2.2.0/ install",
		require => Exec['make_git_prefix'],
		}
	#exec {'set_env':
	#	command => "echo \"export PATH=\$PATH:/usr/local/$git_name/bin\" >> /etc/bashrc",
	#	require => Exec['git_install'],
	#}
}
include git::install