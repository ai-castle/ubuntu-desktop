FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize

# install
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://us.archive.ubuntu.com/ubuntu/|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu|http://us.archive.ubuntu.com/ubuntu|g' /etc/apt/sources.list && \
    apt update && apt install -y \
    ubuntu-desktop dbus dbus-x11 \
    xrdp xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-kde \
    ibus ibus-gtk ibus-gtk3 \
    locales language-pack-en language-pack-gnome-en hunspell-en-us \
    sudo curl net-tools git gedit nano vim tmux libreoffice flatpak \
    evince file-roller nautilus pulseaudio bash-completion wget \
    tar tzdata policykit-1 nmon xclip iputils-ping && \
    rm -rf /var/lib/apt/lists/*

# Remove files that require a system reboot
RUN rm /run/reboot-required*

# xrdp
EXPOSE 3389
RUN adduser xrdp ssl-cert && \
    sed -i '3 a echo "\n\
export GNOME_SHELL_SESSION_MODE=ubuntu\n\
export XDG_SESSION_TYPE=x11\n\
export XDG_CURRENT_DESKTOP=ubuntu:GNOME\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

# locale, language
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# user : 'user' (pw : 1234)
RUN useradd -m user -p $(openssl passwd -1 1234) && \
    usermod -aG sudo user && \
    chsh -s /bin/bash user

# copy entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# run
ENTRYPOINT ["/entrypoint.sh"]



