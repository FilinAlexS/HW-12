#!/usr/bin/env bash
echo ---- Create network jenkins ----
docker network create jenkins
echo
echo ---- Start pull images ----
docker pull jenkins/jenkins:2.426.1-jdk17 # macOS can't find the image and stops the process
docker pull selenoid/chrome:117.0
docker pull selenoid/firefox:118.0
docker pull browsers/safari:15.0
echo
echo ---- Start the build, and then start the necessary images ----
docker compose up --build -d
echo
echo ---- Wait 30 seconds for the Jenkins container to start. Next, let\'s create a job. ----
echo 
sleep 30
echo
echo ---- Create job in Jenkins ----
docker exec -it jenkins sh -c "java -jar /usr/share/jenkins/ref/jenkins-cli.jar -s http://localhost:8080/ create-job homework < /usr/share/jenkins/ref/job_1.xml"
echo
echo ---- DONE ----
echo
echo ---- NEXT ----
echo ----- 1. Go to http://localhost:8085/manage/configureTools/   -----
echo ----- 2. Check or input in "Allure Commandline" Name = Allure -----
echo ----- 3. Go to Dashboard/homework and "Build with parameters" -----
echo