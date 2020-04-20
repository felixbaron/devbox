FROM ubuntu:latest

# apt-get installation
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server python3.7 python-pip curl git neovim gnupg screen

# Enable SSH server
RUN mkdir /var/run/sshd
RUN echo 'root:changeme' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Install Neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ADD init.vim /root/.config/nvim/init.vim

# Install Node.js with nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Install YARN, with fix https://github.com/yarnpkg/yarn/issues/3708
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get remove dminstall;apt update;apt-get install -y yarn


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
