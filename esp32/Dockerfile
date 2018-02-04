FROM fedora:27
LABEL maintainer="Francesco Zanini <francesco@zanini.me>"

ENV IDF_PATH "/usr/local/esp-idf-v3.0-rc1"
ENV PATH "${PATH}:/usr/local/xtensa-esp32-elf/bin"

# Dependencies
RUN dnf install -y @development-tools unzip git wget ncurses-devel flex bison gperf python pyserial

WORKDIR /tmp

# Toolchain
RUN curl -sSLO https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    tar -C /usr/local -xf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

# ESP-IDF
RUN curl -sSLO https://github.com/espressif/esp-idf/releases/download/v3.0-rc1/esp-idf-v3.0-rc1.zip && \
    unzip -qd /usr/local esp-idf-v3.0-rc1.zip && \
    rm esp-idf-v3.0-rc1.zip

RUN dnf clean all

WORKDIR /root
