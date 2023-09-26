# scorpius-phoebus
scorpius phoebus product

A set of install and build scripts to setup scorpius-phoebus product on the scorpius controls/internal n/w.  
It also consists of settings and configuration needed to run cs-studio effectively on the scorpius n/w.  


### Download prebuilt binaries



### Build and Install scorpius Phoebus

Clone the scorpius-phoebus product repo to the installation location.

```
mkdir /opt/epics-tools

git clone https://github.com/osprey-dcs/scorpius-phoebus
./build.sh
```


### Run scorpius Phoebus

```
./run-phoebus
```

If installing on a multi-user host, edit the run-phoebus TOP to point to the phoebus installation folder.  
