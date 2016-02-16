#!/bin/bash

#install authentification for yum repositories on vault
echo "$UTEST_VAULT_SERVER_LOGIN" > /etc/yum/vars/vaultuser
echo "$UTEST_VAULT_SERVER_PASSWORD" > /etc/yum/vars/vaultpasswd

# Install SSH key
mkdir -p ~/.ssh
echo -e $GITLAB_SSH_PRIVATE_KEY > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# Retrieve RTC sources
git clone ${RTC_GIT_PATH} -b ${RTC_GIT_BRANCH_NAME} rtc_ref
# Retrieve Jenkins scripts
git clone ${UTEST_JENKINS_GIT_PATH} -b ${UTEST_JENKINS_GIT_BRANCH_NAME} jenkins_scripts

cd rtc_ref
../jenkins_scripts/rtc_build.sh
