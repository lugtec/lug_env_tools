#! /bin/sh
set -x



mkdir -p ./tar_openssh
cd ./openssh-7.8p1

#scp  sftp  ssh  ssh-add  ssh-agent  ssh-keygen  ssh-keyscan
cp -rf scp ../tar_openssh
cp -rf sftp ../tar_openssh
cp -rf ssh ../tar_openssh
cp -rf ssh-add ../tar_openssh
cp -rf ssh-agent ../tar_openssh
cp -rf ssh-keygen ../tar_openssh
cp -rf ssh-keyscan ../tar_openssh 

#moduli ssh_config sshd_config 
cp -rf moduli ../tar_openssh
cp -rf ssh_config ../tar_openssh
cp -rf ../sshd_config ../tar_openssh 

#sftp-server  ssh-keysign 
cp -rf sftp-server ../tar_openssh
cp -rf ssh-keysign ../tar_openssh 

#sshd 
cp -rf sshd ../tar_openssh 

cp -rf ../openssh/zlib/lib/lib* ../tar_openssh
cp -rf ../openssh/ssl/lib/lib* ../tar_openssh

cp -rf ../config/sshd_config ../tar_openssh
cp -rf ../config/unpackOpenssh.sh ../tar_openssh

cd ../tar_openssh

rm -rf ssh_host_*

ssh-keygen -t rsa -f ssh_host_rsa_key -N ""
ssh-keygen -t dsa -f ssh_host_dsa_key -N ""
ssh-keygen -t ecdsa -f ssh_host_ecdsa_key -N "" 
ssh-keygen -t dsa -f ssh_host_ed25519_key -N ""

chmod 600 ssh_host_dsa_key ssh_host_rsa_key ssh_host_ecdsa_key ssh_host_ed25519_key 
chmod 644 ssh_host_dsa_key.pub ssh_host_rsa_key.pub ssh_host_ecdsa_key.pub ssh_host_ed25519_key.pub

cd ..
tar -czvf tar_openssh.tar tar_openssh/

echo "all file cp to ./tar_openssh dir"
