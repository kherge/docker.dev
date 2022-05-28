FROM kherge/ubuntu-server:22.04

# Disable prompts in apt.
ARG DEBIAN_FRONTEND=noninteractive

# Install packages typically used in development.
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        libssl-dev pkg-config \
        zlib1g-dev libffi-dev libbz2-dev libreadline-dev libsqlite3-dev \
        curl git gnupg2 sudo unzip vim zip \
        htop

# Create the development user.
RUN adduser dev && \
    usermod --append --groups sudo dev && \
    (echo "dev:dev" | chpasswd)

# Change the user and working directory.
   USER dev
WORKDIR /home/dev

# Install sh.env.
RUN git clone https://github.com/kherge/sh.env.git ~/.local/opt/sh.env && \
    echo >> ~/.bashrc && \
    echo 'export ENV_DIR="$HOME/.local/opt/sh.env"' >> ~/.bashrc && \
    echo '. "$ENV_DIR/env.sh"' >> ~/.bashrc

# Run forever.
CMD ["sleep", "infinity"]
