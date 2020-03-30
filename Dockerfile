FROM node:10
RUN DEBIAN_FRONTEND=noninteractive apt-get update\
    && curl -sSL https://get.docker.com/ | sh\
    && service docker start\
    && apt-get upgrade -y\
    && apt-get install -y --no-install-recommends \
        build-essential g++ python2.7 python2.7-dev unzip curl zip git bash\
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp \
    && cd /tmp \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli ecs-deploy \
    && rm -f /tmp/get-pip.py \
    && export PATH=~/.local/bin:/usr/bin/:$PATH