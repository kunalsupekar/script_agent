#!/bin/bash




mkdir myagent && cd myagent

curl -O https://vstsagentpackage.azureedge.net/agent/3.240.1/vsts-agent-linux-x64-3.240.1.tar.gz

tar zxvf vsts-agent-linux-x64-3.240.1.tar.gz


ORG_URL="https://dev.azure.com/Intern-organisation"  # Your organization URL
PAT="fn26kdogzfrhjh5kctczpmin5mthlxgzcz2njwrlxgjzlm2hg2ha"  # Your Personal Access Token
AGENT_POOL_NAME="AWS-Agent"  # The agent pool you want to add the agent to
AGENT_NAME=$(hostname)  # Unique name for the agent
WORK_DIR="_work"

./config.sh --unattended \
            --url $ORG_URL \
            --auth pat \
            --token $PAT \
            --pool $AGENT_POOL_NAME \
            --agent $AGENT_NAME \
            --work $WORK_DIR \
            --replace \
            --acceptTeeEula

sudo ./svc.sh install

sudo ./svc.sh start
