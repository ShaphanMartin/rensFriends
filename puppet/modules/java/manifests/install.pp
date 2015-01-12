class java::install(
        $module_path="/vagrant/puppet/modules/java/files/",
        $archive="jdk-8u25-linux-x64.tar.gz",
        $java_home="/opt/jdk1.8.0_25",
        $java_home2="/opt/jdk1.8.0_25/jdk1.8.0_25/",

)

{
        exec{'download_jdk':
                cwd => $module_path,
                command => "/usr/bin/wget --no-check-certificate -c --header 'Cookie: oraclelicense=accept-securebackup-cookie' 'http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz'",
                logoutput => on_failure,
                creates => "$module_path$archive",
                user => root,
        }
        file{$java_home:
                ensure => "directory",
                owner => "root",
                group => "root",
                mode => 750,
           before => Exec['extract_jdk'],
        }
        exec{'extract_jdk':
                command => "/bin/tar zxvf $module_path$archive -C $java_home/.",
                #logoutput => true,
                require => Exec['download_jdk'],
        }
        exec{'install_jdk':
                command => "/usr/sbin/update-alternatives --install /usr/bin/java java $java_home2/bin/java 2",
				
                require => Exec['extract_jdk'],
        }
		exec {'apply_perm_java':
			command => "/bin/chmod a+x /opt/jdk1.8.0_25",
			require => Exec['install_jdk'],
			}
		
}

include java::install
