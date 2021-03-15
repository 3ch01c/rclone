FROM debian
LABEL maintainer="James Wernicke <wernicke@lanl.gov>"

RUN apt update \
 && apt install -y \
    curl \
    unzip \
 && rm -rf /var/lib/apt/lists/*
RUN curl https://rclone.org/install.sh | bash 
ENTRYPOINT ["bash", "-c"]
CMD ["rclone", "-h"]
