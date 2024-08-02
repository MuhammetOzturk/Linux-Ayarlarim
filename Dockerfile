FROM debian

RUN apt update                                                                   && \
    apt install curl vim vim-youcompleteme vim-addon-manager                        \
    libgl-dev vim-snippets python3 python3-pip screen                               \
    python3-venv git zsh x11-apps libopencv-dev -y                               && \
    vam install youcompleteme                                                    && \
    python3 -m venv venv                                                         && \
    . venv/bin/activate                                                          && \
    pip install                                                                     \
    torch torchaudio torchvision scikit-learn                                       \
    matplotlib notebook transformers opencv-python PyQt5 "gymnasium[all]"           \
    requests_futures bottle waitress watchdog jedi                               && \
    curl  https://ollama.com/install.sh -o /tmp/ollama.sh && bash /tmp/ollama.sh && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

ENV PATH="/venv/bin:$PATH"
RUN . /venv/bin/activate

VOLUME /tmp/.X11-unix/ /tmp/.X11-unix/


ENV DISPLAY=:0

COPY .vimrc /root/.vimrc
COPY .vim   /root/.vim     
COPY .tmux.conf /root/.tmux.conf 
COPY .tmux  /root/.tmux
  

EXPOSE 8888
EXPOSE 8000

CMD ["zsh"]


