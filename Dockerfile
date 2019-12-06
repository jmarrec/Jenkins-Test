# docker build -t openstudio_resources_ubuntu_1804 .

FROM ubuntu:18.04

WORKDIR /home/ubuntu

# Send build context (.dockerignore just specifies to send the OpenStudio-2.9.0.801faa459c-Linux.deb)
ADD . .

# This variable is being checked for in the ruby script
ENV JENKINS_URL=http://localhost:8080 \
    DEBIAN_FRONTEND=noninteractive
# Might be worth messing with the locale settings to test for bad conversions (decimal separators etc)
# LC_ALL=fr_FR.UTF8

RUN apt update &&\
    apt install -y apt-utils wget git libgdbm-compat4 libgdbm5 python3-pip &&\
    wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb &&\
    apt install -y ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb &&\
    rm ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb &&\
    ln -sf /usr/lib/x86_64-linux-gnu/libgdbm.so.5.0.0 /usr/lib/x86_64-linux-gnu/libgdbm.so.3 &&\
    ln -sf /usr/lib/x86_64-linux-gnu/libgdbm_compat.so.4.0.0 /usr/lib/x86_64-linux-gnu/libgdbm_compat.so.3 &&\
    pip3 install beautifulsoup4 df2gspread docopt lxml jupyter matplotlib numpy pandas requests seaborn tqdm xmldiff &&\
    apt install -y ./OpenStudio-2.9.0.801faa459c-Linux.deb &&\
    mkdir -p /home/ubuntu/git/ && cd /home/ubuntu/git/ && git clone https://github.com/NREL/OpenStudio-resources.git &&\
    cd OpenStudio-resources &&\
    git checkout CI  # Checking out the branch on which I made necessary changes
