#!/bin/bash
# Fill in with pbench repo url:
source ../satperf.cfg

# Install pbench repo
sudo wget -O /etc/yum.repos.d/pbench.repo ${PBENCH_REPO}
# Install pbench-agent
sudo yum install -y pbench-agent
# Source pbench-agent
source /opt/pbench-agent/config

#install pbench-agent in capsules
for capsid in `echo $CAPSULES`; do
ssh root@$capsid "wget -O /etc/yum.repos.d/pbench.repo ${PBENCH_REPO}"
ssh root@$capsid "yum install -y pbench-agent"
ssh root@$capsid "source /opt/pbench-agent/config"
done
