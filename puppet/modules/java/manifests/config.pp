class java::config (
        $string = "export JAVA_HOME=/opt/jdk1.8.0_25/jdk1.8.0_25\nexport JRE_HOME=/opt/jdk1.8.0_25/jdk1.8.0_25/jre\nexport PATH=\$PATH:/opt/jdk1.8.0_25/jdk1.8.0_25/bin:/opt/jdk1.8.0_25/jdk1.8.0_25/jre/bin"
)
{
		
        file {'/etc/profile.d/java.sh':

                content => $string,

        }
		
}
include java::config
