FROM node:19.3.0-bullseye

RUN apt update && \
    apt install -y \
        less \
        vim

ENV USER cheerio
RUN useradd -m $USER
USER $USER
WORKDIR /home/$USER

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
