FROM jenkins/jenkins:2.426.1-jdk17
USER root
RUN apt-get update
RUN apt-get install python3-venv -y
USER jenkins
COPY plugins_list.txt /usr/share/jenkins/ref/plugins_list.txt
COPY jenkins-cli.jar /usr/share/jenkins/ref/jenkins-cli.jar
COPY job_1.xml /usr/share/jenkins/ref/job_1.xml
ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins_list.txt