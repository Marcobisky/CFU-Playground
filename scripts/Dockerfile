FROM debian:testing

ENV RISCV_DIR=/toolchain/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14/bin
ENV PATH="/third_party/renode:${RISCV_DIR}:${PATH}"
ARG WORKDIR=/CFU-Playground

RUN apt update -y && apt install -y wget git python3-pip make gcc openocd yosys expect ccache verilator libevent-dev libjson-c-dev libusb-1.0-0-dev libftdi1-dev vim curl bzip2 && rm -rf /var/lib/apt/lists/*

# Install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh && \
    /opt/conda/bin/conda clean -ya

ENV PATH="/opt/conda/bin:${PATH}"

RUN mkdir /toolchain && cd /toolchain && wget --progress=dot:giga https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz && tar xf riscv64*tar.gz && rm riscv64*tar.gz

RUN mkdir -p /third_party/renode && wget --progress=dot:giga https://dl.antmicro.com/projects/renode/builds/renode-latest.linux-portable.tar.gz && tar xf renode-*tar.gz -C /third_party/renode --strip-components=1 && rm renode-*tar.gz && python3 -m pip install --break-system-packages -r /third_party/renode/tests/requirements.txt

RUN git clone https://github.com/google/CFU-Playground ${WORKDIR}
WORKDIR ${WORKDIR}

RUN ./scripts/setup -ci