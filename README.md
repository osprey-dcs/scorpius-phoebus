# scorpius-phoebus
scorpius phoebus product

A set of install and build scripts to setup scorpius-phoebus product on the scorpius controls/internal n/w.  
It also consists of settings and configuration needed to run cs-studio effectively on the scorpius n/w.  


### Download prebuilt binaries

Download pre built binaries:
[scorpius-phoebus releases
](https://drive.google.com/drive/folders/12zAMoY7rBmo_g8HbxOrgjggVEn7HkDCN?usp=sharing)
```
export PHOEBUS_JAR=/path/to/downloaded/scorpius-product-4.7.2.jar
export PHOEBUS_CONFIG=/path/to/scropius/config/settings.ini

JDK_JAVA_OPTIONS=" -DCA_DISABLE_REPEATER=true"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Dnashorn.args=--no-deprecation-warning"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Djdk.gtk.verbose=false -Djdk.gtk.version=2 -Dprism.forceGPU=true"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Dlogback.configurationFile=/home/train/epics-tools/setup/settings/logback.xml"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Dorg.csstudio.javafx.rtplot.update_counter=false"
export JDK_JAVA_OPTIONS

java -jar $PHOEBUS_JAR -settings $PHOEBUS_CONFIG -logging $TOP/config/logging.properties "$@" &
```

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
