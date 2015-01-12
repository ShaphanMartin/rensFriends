class git::config(
	$string="export PATH=\$PATH:/usr/local/git-2.2.0/bin ",
)
{
	file{'/etc/profile.d/git.sh':
		content => $string,
	}
	#exec {'set_env':
	#	cwd => "/cwd",
	#	command => "echo \"export PATH=\$PATH:/usr/local/git/bin\" >> /etc/bashrc",
	#	after => Exec['git::install'],
#
#	}
}
include git::config