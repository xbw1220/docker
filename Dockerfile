FROM blacklabelops/jenkins

USER root
RUN yum install -y firefox xorg-x11-server-Xvfb Xorg dbus-x11
USER jenkins
