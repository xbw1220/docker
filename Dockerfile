FROM blacklabelops/jenkins

ENV SCREEN_WIDTH 1360
ENV SCREEN_HEIGHT 1020
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0

#RUN yum install -y firefox xorg-x11-server-Xvfb Xorg dbus-x11
USER root
RUN yum install -y firefox xorg-x11-server-Xvfb Xorg
USER jenkins
