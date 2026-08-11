# Raspberry Pi (ARM64) Docker Simulation Environment
FROM --platform=linux/arm64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies & SSH
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    python3 \
    python3-pip \
    python3-dev \
    git \
    curl \
    wget \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Configure SSH
RUN mkdir /var/run/sshd && \
    echo 'root:raspberry' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config &&     sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

# Install Python ML/AI packages for Raspberry Pi testing
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir \
    numpy \
    onnxruntime \
    opencv-python-headless

WORKDIR /workspace

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
