# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-full:2022-08-13-08-17-48

# Remove gitpod managed Go install
RUN rm -rf /home/gitpod/go && \
    unset GOPATH && \
    unset GOROOT

# Install asdf and asdf plugins
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
RUN echo -e "\n. $HOME/.asdf/asdf.sh" >> ~/.bashrc
RUN echo -e "\n. $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
RUN asdf plugin-add golang

# Install Go 1.18.x
RUN asdf install golang 1.18.5
RUN asdf global golang 1.18.5