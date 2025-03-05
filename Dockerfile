FROM ubuntu:22.04

# Set non-interactive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    psmisc \
    procps \
    wget \
    xdg-utils \
    xvfb \
    ffmpeg \
    curl \
    bash \
    software-properties-common \
    dbus-x11 \
    dbus-user-session \
    x11vnc \
    x11-utils \
    vlc \
    pipewire \
    pipewire-pulse \
    wireplumber \
    pipewire-audio-client-libraries \
    pulseaudio-utils \
    libportaudio2 \ 
    && rm -rf /var/lib/apt/lists/*

# Allow VLC to run as root
RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc

# Set up the working directory
WORKDIR /app

# Copy the project files
COPY . .


# Set up the runtime directory for PipeWire
RUN mkdir -p /run/user/1000 && chmod 700 /run/user/1000

# Set up the environment
ENV DISPLAY=:99 

# Create entrypoint script
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
