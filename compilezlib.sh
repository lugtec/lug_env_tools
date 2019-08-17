cd  zlib-1.2.11

make distclean

CC=arm-hisiv500-linux-gcc AR=arm-hisiv500-linux-ar RANLIB=arm-hisiv500-ranlib ./configure --prefix=/opt/arm/ssh/zlibinstall --static 

make -j8

make install 

echo "zlib ok"
