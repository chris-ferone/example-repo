ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# install linux packages
COPY .devcontainer/linux-packages.txt /tmp/tmp-pkgs/
RUN apt update && export DEBIAN_FRONTEND=noninteractive && \
    apt -y --no-install-recommends install $(cat /tmp/tmp-pkgs/linux-packages.txt | tr '\n' ' ') && \
    rm -rf /tmp/tmp-pkgs

# install python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt