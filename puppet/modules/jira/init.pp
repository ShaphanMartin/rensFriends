class jira(
        $archive="atlassian-jira-6.3.13-x64.bin",
)
{
	exec{'download_jira':
			cwd => /opt/,
			command => "wget http://www.atlassian.com/software/jira/downloads/binary/$archive",
			user => root,
	}
	 exec{'change_access':
			cwd => $/opt/,
			command => "chmod a+x $archive",
			require => Exec['download_jira'],
	}
	 exec{'install':
			cwd => $/opt/,
			command => "yes 1\n2\n8081\n8006\n | ./$archive",
			require => Exec['change_access'],
	}
	
}