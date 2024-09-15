Step 1: On windows, install WSL (Windows subsystem for linux); Open Power Shell in Administrato mode ; wsl --install 

Step 2: Install the following package, once WSL is installed.
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible

$ ansible --version 
