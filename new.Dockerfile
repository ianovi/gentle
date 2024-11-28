# Description: Dockerfile for Gentle TTA (Text-to-Audio Alignment)

# Use the official image as a parent image for AMD64 architecture
#FROM kaldiasr/kaldi:cpu-latest
# Use the unofficial image as a parent image for ARM architecture
FROM kaldi:arm

# Install the necessary packages
RUN DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install -y git-lfs ffmpeg mc htop python3-pip python3.11-venv \
	&& apt-get autoremove -y -f \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& find /tmp/ /var/log/ -mindepth 1 -delete \
	&& rm -rf /root/.cache

EXPOSE 8765

#VOLUME /gentle/webdata

WORKDIR /gentle

# Copy the custom entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Specify CMD for subsequent launches
CMD ["python /gentle/serve.py"]
