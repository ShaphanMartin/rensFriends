class jenkins(
		$module_path="/vagrant/puppet/modules/jenkins/files"
		
)
{
	exec{'download_jenkins':
			cwd => "/vagrant/puppet/modules/jenkins/files",	
			command => "/usr/bin/wget –O /etc/yum.repos.d/Jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo",
			logoutput => on_failure,
			creates => "/etc/puppet/modules/jenkins/files/",
			user => root,
	}
	 exec{'import_rpm':
			command => "/usr/bin/rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key",
			require => Exec['download_jenkins'],
	}
	
	exec{'install_jenkins':
			command => "/usr/bin/yum -y install jenkins",
			user => root,

	}
	
}
