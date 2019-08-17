cd openssl-1.0.2p

make distclean 

./Configure --prefix=/opt/arm/ssh/opensslinstall no-shared no-asm no-async no-weak-ssl-ciphers --cross-compile-prefix=/opt/hisi-linux/x86-arm/arm-hisiv500-linux/target/arm-hisiv500-linux- linux-armv4

make -j8

make install 

echo "openssl ok"
