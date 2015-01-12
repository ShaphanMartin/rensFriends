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
	
	
	 exec{'run_script':
			command => "/vagrant/puppet/modules/jira/files/input.sh",
			require => Exec['change_access'],
	}
	
}

