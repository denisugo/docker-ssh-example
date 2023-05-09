FROM node:lts
# SSH setup
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:astro' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/DenyUsers root/#DenyUsers root/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

# Classic setup
WORKDIR /app/projects
VOLUME /app/projects
EXPOSE 3000

CMD ["/usr/sbin/sshd", "-D"]