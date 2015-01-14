#rensFriends

##Configuring Git

1. Go into git bash with admin rights 
2. Create an empty folder to pull your project into (using mkdir)
3. Type `git init` in the new folder
4. Now set up the config first `git config --global user.name "John Doe`
5. then the email `git config --global user.email johndoe@example.com`

##SSH Key Setup

1. make a new folder for your ssh key
2. `mkdir /c/Users/training##/.ssh/`  `
3. `ssh-keygen -t rsa -C "johndoe@example.com"`
4.  set the dirctory to the folder you created
5.  press enter to have set no password
6. `cat /c/Users/training##/.ssh/id_rsa.pub`copy the key
7.  now on the github website add the ssh key to your account by: 
    Settings > SSH Keys > Add SSH Key > give it a Title and paste the key > Add Key
8.  `ssh -T git@github.com`
9.  when you are greated with your name
10. `git pull git@github.com:ShaphanMartin/rensFriends.git`

## Starting the vagrant VM
In the folder you created 
`vagrant up`

