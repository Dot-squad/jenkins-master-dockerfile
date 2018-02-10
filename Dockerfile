FROM jenkins/jenkins:latest

USER root
RUN curl -fsSL get.docker.com -o get-docker.sh && bash get-docker.sh
RUN usermod -aG docker jenkins
USER jenkins