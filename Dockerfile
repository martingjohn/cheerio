ARG FROM_VER
FROM mcr.microsoft.com/playwright:${FROM_VER:-v1.29.0-focal}

ENV USER cheerio
COPY requirements.apt requirements.apt
RUN useradd -m \
            -s /bin/bash \
            -d /app \
            $USER && \
    apt update && \
    xargs apt install -y --no-install-recommends < requirements.apt

USER $USER
WORKDIR /home/$USER

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
