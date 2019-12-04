FROM atlassian/default-image:2

RUN apt update && apt install -y python3-dev
RUN cd /usr/local/bin && ln -s /usr/bin/python3 python
RUN apt install -y python3-pip --reinstall
RUN pip3 install -U pip

WORKDIR /opt/atlassian/bitbucketci/agent/build

ENTRYPOINT /bin/bash
