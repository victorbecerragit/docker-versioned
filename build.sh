set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=victorbecerra
# image name
IMAGE=helloworld
docker build -t $USERNAME/$IMAGE:latest .

#Functions
git_setup () {
 # setup user/email from github
 git init
 git config --global user.name "victorbecerragit"
 git config --global user.email vbecerraar@gmail.com
}

git_build () {
 git add -A
 git add .gitignore
 git commit -m "initial project"
 echo "Test git ssh"
 ssh -T git@github.com
 echo "Create a new repo on github"
 curl -u 'victorbecerragit' https://api.github.com/user/repos -d '{"name":"docker-versioned"}'
}

#Setup git branch if this doesn't exist 

if [[ -f $PWD/.git/config ]]; then
 echo "Git configured"
else
 echo "Git unconfigured"
 echo "Setup git configuration..."
 git_setup
 echo "git init..."
 git_build
fi

