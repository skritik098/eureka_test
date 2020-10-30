FROM openjdk:8-jdk-alpine

LABEL io.k8s.description="eureka application" \  
      io.k8s.display-name="eureka" \
      io.openshift.expose-service="8761:http" \
      io.openshit.tags="eureka,java"

EXPOSE 8761

EXPOSE 

## This part need to tested and verified by compiling the code
ADD target/* /apps

USER 1001

ENTRYPOINT "java -Xms128m -Xmx256m -Djavax.management.builder.initial -DLOGS_DIR=/apps/footc/logs/csw_eureka_server -Dcom.sun.management.jmxremote.port=25105 -Dcom.sun.management.config.file=/apps/footc/application/csw/env/properties/jmx.properties -DAPP_NAME=CSW_EUREKA_SERVER -javaagent:/apps/appdynamics/java_agent/javaagent.jar -Dappdynamics.agent.logs.dir=/apps/footc/logs/appdynamics -DSERVICE_ENV_VAR=DEV -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime -Xlogge:/apps/footc/logs/csw_eureka_server/GC/GC.log -XX:+HeapDumpOnOutOfMemoryError -Dmanagement.health.diskspace.enabled=false -Deureka.client.enabled=true -DEOPS_EUREKA_CLUSTER=http://ah-1040158 001.sdi.corp.bankofamerica.com:8761/eureka, http://ah-1040159-001.sdi.corp.bankofamerica.com:8761/eureka -DEUREKA_HOSTNAME=ah1040158-001.sdi.corp.bankofamerica.com -Dloader.path=/apps/footc/application/csw/config,/apps/footc/application/springboot_app/csw_eureka_server/config,/apps/footc/application  -jar /apps/footc/application/springboot_app/csw eureka_server/lib/csw.eureka_server-25.1.2.jar"
