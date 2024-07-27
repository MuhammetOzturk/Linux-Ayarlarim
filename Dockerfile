FROM debian

RUN apt update                                                                 && \
    apt install curl vim vim-youcompleteme vim-addon-manager                      \
    curl libgl-dev vim-snippets python3 python3-pip screen                        \
    python3-venv git zsh x11-apps libopencv-dev -y                             && \
    vam install youcompleteme                                                  && \
    python3 -m venv venv                                                       && \
    . venv/bin/activate                                                        && \
    pip install torch torchaudio torchvision scikit-learn                         \
    matplotlib notebook transformers opencv-python                                \
    requests_futures bottle waitress watchdog jedi                             && \
    git clone https://github.com/MuhammetOzturk/Linux-Ayarlarim.git /tmp/linux && \
    cp -r /tmp/linux/.vimrc /root/                                             && \
    cp -r /tmp/linux/.vim   /root/                                             && \
    cp -r /tmp/linux/.tmux.conf /root/                                         && \
    cp -r /tmp/linux/.tmux  /root/                                             && \
    screen -d -m "vim +PlugUpdate +qall"                                       && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

ENV PATH="/venv/bin:$PATH"
RUN . /venv/bin/activate

VOLUME /tmp/.X11-unix/ /tmp/.X11-unix/


ENV DISPLAY=:0

  

EXPOSE 8888
EXPOSE 8000

CMD ["zsh"]


