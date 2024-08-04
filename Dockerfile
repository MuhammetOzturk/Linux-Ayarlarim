FROM debian

RUN apt update                                                                   && \
    apt install -y  vim vim-youcompleteme vim-addon-manager vim-snippets            \ 
    python3 python3-pip python3-venv libopencv-dev                                  \
    git zsh x11-apps curl tmux screen                                            && \
                                                                                    \
    vam install youcompleteme                                                    && \
                                                                                    \
    python3 -m venv venv                                                         && \
                                                                                    \
    . venv/bin/activate                                                          && \
    pip install                                                                     \
                                                                                    \
    #vim-youcomleteme icin gerekli paketler                                         \
    requests_futures bottle waitress watchdog jedi                                  \
                                                                                    \
    #Derin ogrenme kutuphaneleri                                                    \
    torch torchvision torchaudio                                                    \
                                                                                    \
    #Goruntu ve veri isleme kutuphaneleri                                           \
    opencv-python matplotlib scikit-learn pandas notebook PyQt5                     \        
                                                                                    \
    #Pekistirmeli ogrenme kutuphaneleri                                             \
    "gymnasium[all]" "stable-baselines3"                                         && \
                                                                                    \
    #ollama kurulumu                                                                \
    curl https://ollama.com/install.sh -o /tmp/ollama.sh && bash /tmp/ollama.sh  && \
                                                                                    \
    #oh-my-zsh kurulum                                                              \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

ENV PATH="/venv/bin:$PATH"
RUN . /venv/bin/activate

#X server uygulamalarini calistirmak icin gerekli
VOLUME /tmp/.X11-unix/ /tmp/.X11-unix/


ENV DISPLAY=:0

COPY .vimrc /root/.vimrc
COPY .vim   /root/.vim     
COPY .tmux.conf /root/.tmux.conf 
COPY .tmux  /root/.tmux
  
RUN yes | vim -c PlugInstall -c qa

EXPOSE 8888
EXPOSE 8000

CMD ["zsh"]


