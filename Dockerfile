FROM debian:buster

RUN apt-get update && apt-get install -y python build-essential wget libssl-dev bc kmod cpio flex libncurses5-dev libelf-dev u-boot-tools
RUN    wget https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/aarch64-linux-gnu/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz && tar xvf gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz  -C /usr/local/ 

ENV ARCH=arm64
ENV CROSS_COMPILE=/usr/local/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
WORKDIR /src
CMD [ "make", "-j8" ]
