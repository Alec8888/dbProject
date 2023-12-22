# Contributer Guide


### Contributors
- Joseph Barron
- Christian Carey
- Quan Nguyen
- Alec Patterson

### What this app does
...


### Front End
...

### Back End
...

### ORacle deployment
Set up db

start instance

update yum

install gh cli  
```
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh
```
`sudo dnf update gh`

install node  
`dnf module install nodejs:18/common`

install yarn  
`corepack enable`  
`yarn init -1`  

install dependencies  
./server `yarn install`  
./client `yarn install`

install oralce instance client  
`sudo yum install oracle-instantclient-basiclite-21.12.0.0.0-1.el8.x86_64.rpm`

???

profit