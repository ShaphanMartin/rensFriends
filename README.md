#rensFriends

##Configuring Git

1. Go into git bash with admin rights 
2. Create an empty folder to pull your project into (using mkdir)
3. Type `git init` in the new folder
4. Now set up the config first `git config --global user.name "John Doe`
5. Then the email `git config --global user.email johndoe@example.com`

##SSH Key Setup

1. Make a new folder for your ssh key
2. `mkdir /c/Users/training##/.ssh/`  `
3. `ssh-keygen -t rsa -C "johndoe@example.com"`
4.  Set the dirctory to the folder you created
5.  Press enter to have set no password
6. `cat /c/Users/training##/.ssh/id_rsa.pub`copy the key
7.  Now on the github website add the ssh key to your account by: 
    Settings > SSH Keys > Add SSH Key > give it a Title and paste the key > Add Key
8.  `ssh -T git@github.com`
9.  When you are greated with your name
10. `git pull git@github.com:ShaphanMartin/rensFriends.git`

## Starting the vagrant VM
In the folder you created 
`vagrant up`

#Checking if all are installed

1. SSH into the machine using the git bash `vagrant ssh`
2. Gets the ip of the machine using `ifconfig`
3. Save the ip of the machine

##Java

`java -version`

##Maven

`mvn --version`

##Git

`git --version`

##Jira
1. Using the ip of the machine
2. Type `http://machineip:8081`
3. (may take some time to load)

## [Jenkins](https://www.youtube.com/watch?v=LkCNJRfSZBU)

1. Using the ip of the machine
2. Type `http://machineip:8080`

##Nexus

1. `nexus start`
2. Using the ip of the machine
3. Type `http://machineip:8088/nexus`
4. (may take some time to load)

##Nexus setup
Notice about running Nexus

1. In the nexus propeties file `/vagrant/puppet/modules/nexus/files/nexus-2.11.1-01/conf/nexus.properties`
2. ensure the application port is set to `8088`
3. ensure the application host is set to your vm ip
4. Then restart the nexus system 'nexus restart'
