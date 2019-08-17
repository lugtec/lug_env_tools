cd openssh-7.8p1

make distclean

./configure --host=arm-hisiv500-linux --with-libs --with-zlib=/opt/arm/ssh/zlibinstall --with-ssl-dir=/opt/arm/ssh/opensslinstall --disable-etc-default-login CC=arm-hisiv500-linux-gcc AR=arm-hisiv500-linux-ar

make -j8

arm-hisiv500-linux-strip sshd 
arm-hisiv500-linux-strip ssh-keygen 
cd ..

echo "openssh compile ok"

