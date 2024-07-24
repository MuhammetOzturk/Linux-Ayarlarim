FROM debian

RUN apt update && \
    apt install vim vim-youcompleteme vim-addon-manager curl \
    vim-snippets python3 python3-pip python3-venv git zsh -y && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    vam install youcompleteme && \
    python3 -m venv venv && \
    . venv/bin/activate && \
    pip install torch torchaudio torchvision scikit-learn \
    matplotlib notebook transformers opencv-python 


EXPOSE 8888
EXPOSE 8000

ENTRYPOINT ["zsh"]

