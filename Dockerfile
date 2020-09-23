FROM alpine:latest

RUN apk add --no-cache openssh-server curl git nodejs npm python3 python3-dev neovim gnupg screen ctags yarn
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing hub
RUN npm install -g neovim

# Enable SSH server
RUN ssh-keygen -A
RUN mkdir /var/run/sshd
RUN echo 'root:changeme' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Install Neovim plugins
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ADD init.vim /root/.config/nvim/init.vim
RUN nvim --headless +PlugInstall +qall
RUN echo 'alias vi=nvim' >> ~/.profile

# Python packages
RUN python3 -m pip install virtualenv
RUN echo 'source ~/dev/python/venv/bin/activate' >> ~/.profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
