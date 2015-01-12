class jira(
        $jira_archive="atlassian-jira-6.3.13-x64.bin",
		$module_path="/vagrant/puppet/modules/jira/files"
		
)
{
	exec{'download_jira':
			cwd => "/vagrant/puppet/modules/jira/files",	
			command => "/bin/wget -c http://www.atlassian.com/software/jira/downloads/binary/$jira_archive",
			logoutput => on_failure,
			creates => "/etc/puppet/modules/jira/files/",
			user => root,
	}
	 exec{'change_access':
			command => "/bin/chmod a+x /vagrant/puppet/modules/jira/files/atlassian-jira-6.3.13-x64.bin",
			require => Exec['download_jira'],
	}
	
	exec{'install_expect':
			command => "/usr/bin/yum -y install expect",
			before => Exec[run_script],
			user => root,

	}
	 exec{'run_script':
			cwd => "/vagrant/puppet/modules/jira/files/",
			command => "/usr/bin/expect /vagrant/puppet/modules/jira/files/input.exp",
			require => Exec['change_access'],
			user => root,

	}
	
}

