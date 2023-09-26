#!/bin/bash

# Phoebus build and installation location
TOP="$PWD"

export JAVA_HOME=$TOP/lib/jvm/jdk-11.0.2
export PATH="$JAVA_HOME/bin:$PATH"

echo $TOP
V="4.7.2"

# figure out the path to the product jar
if [[ -z "${PHOEBUS_JAR}" ]]; then
  PHOEBUS_JAR=${TOP}/scorpius-phoebus/products/target/scorpius-product-${V}.jar
fi

# figure out the path to the configuration settings
if [[ -z "${PHOEBUS_CONFIG}" ]]; then
  PHOEBUS_CONFIG=${TOP}/scorpius-phoebus/config/settings.ini
fi

# To get one instance, use server mode
ID=$(id -u)
OPT="-server 4$ID"

JDK_JAVA_OPTIONS=" -DCA_DISABLE_REPEATER=true"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Dnashorn.args=--no-deprecation-warning"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Djdk.gtk.verbose=false -Djdk.gtk.version=2 -Dprism.forceGPU=true"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Dlogback.configurationFile=/home/train/epics-tools/setup/settings/logback.xml"
JDK_JAVA_OPTIONS="$JDK_JAVA_OPTIONS -Dorg.csstudio.javafx.rtplot.update_counter=false"
export JDK_JAVA_OPTIONS

echo $JDK_JAVA_OPTIONS

java -jar $PHOEBUS_JAR -settings $PHOEBUS_CONFIG -logging $TOP/scorpius-phoebus/config/logging.properties $OPT "$@" &
