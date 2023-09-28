FROM ubuntu:latest

RUN apt update && apt install -y sudo

RUN useradd --uid 1001 --create-home --shell /bin/bash -G sudo,root isucon
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get install -y mysql-server

COPY ./isulog /home/isucon/isulog

RUN apt-get install -y make wget
USER isucon

WORKDIR /home/isucon/isulog
RUN sudo apt install -y vim git-core htop dstat unzip graphviz jq silversearcher-ag iotop iftop sysstat &&  \
	# make zsh-init
	# make redis-init
	# make scripts-dl
	# make ssh_key_add
	# make alp-init
	make perconia-init && \
	# make kataribe-init && \
	# make slackcat-init && \
	# make prepare-mysql-slowlog && \
	sudo tools/isulog install
