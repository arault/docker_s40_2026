FROM debian:13

# Variables
ARG user

# Installation serveur SSH
RUN apt update && \
    apt install -y openssh-server && \
    useradd -m -s /bin/bash ${user}
ADD --chown=${user} ssh_client_config_dir.tar.gz /home/${user}

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D", "-d" ]