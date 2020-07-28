FROM archlinux:20200505
LABEL maintainer="Nyk Ma <i@nyk.ma>"

RUN pacman -Syyu --noconfirm && pacman -S --noconfirm unzip git curl tar gnupg && \
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8 && \
        echo '. $HOME/.asdf/asdf.sh' > ~/.bashrc && \
        echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc && \
        source $HOME/.asdf/asdf.sh && \
        asdf plugin add nodejs && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring && asdf plugin remove nodejs
