#! /bin/sh
set -x

echo "unpackOpenssh begin"
mkdir -p /usr/local/bin/
mkdir -p /usr/local/sbin/
mkdir -p /usr/local/etc/
mkdir -p /usr/local/libexec/
mkdir -p /var/run/
mkdir -p /var/empty/

chmod 744 scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan ssh_config sftp-server ssh-keysign sshd

#scp  sftp  ssh  ssh-add  ssh-agent  ssh-keygen  ssh-keyscan 拷贝到目标板/usr/local/bin 
cp -rf scp /usr/local/bin/
cp -rf sftp /usr/local/bin/
cp -rf ssh /usr/local/bin/
cp -rf ssh-add /usr/local/bin/
cp -rf ssh-agent /usr/local/bin/
cp -rf ssh-keygen /usr/local/bin/
cp -rf ssh-keyscan /usr/local/bin/

#moduli ssh_config sshd_config 拷贝到目标板 /usr/local/etc
chmod 620 moduli 
cp -rf moduli /usr/local/etc 
chmod 644 ssh_config 
cp -rf ssh_config /usr/local/etc 
chmod 600 sshd_config 
cp -rf sshd_config /usr/local/etc 

#sftp-server  ssh-keysign 拷贝到目标板 /usr/local/libexec 

cp -rf sftp-server /usr/local/libexec
cp -rf ssh-keysign /usr/local/libexec

#sshd 拷贝到目标板 /usr/local/sbin/ 
cp -rf sshd /usr/local/sbin/

#//将公钥和私钥拷贝至/usr/local/etc下
chmod 600 ssh_host_dsa_key ssh_host_rsa_key ssh_host_ecdsa_key ssh_host_ed25519_key 
chmod 644 ssh_host_dsa_key.pub ssh_host_rsa_key.pub ssh_host_ecdsa_key.pub ssh_host_ed25519_key.pub

cp -rf ssh_host_dsa_key /usr/local/etc
cp -rf ssh_host_rsa_key /usr/local/etc
cp -rf ssh_host_ecdsa_key /usr/local/etc
cp -rf ssh_host_ed25519_key /usr/local/etc

cp -rf ssh_host_dsa_key.pub /usr/local/etc
cp -rf ssh_host_rsa_key.pub /usr/local/etc
cp -rf ssh_host_ecdsa_key.pub /usr/local/etc
cp -rf ssh_host_ed25519_key.pub /usr/local/etc

echo "sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin" >> /etc/passwd


echo "unpackOpenssh finished"
/usr/local/sbin/sshd 
echo "sshd start!"
