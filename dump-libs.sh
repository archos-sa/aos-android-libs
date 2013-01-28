#!/bin/sh

dump_symbols()
{
	nm -D $1 | awk '{print $3}' | grep -v '^__aeabi\|__FINI_ARRAY__\|__INIT_ARRAY__\|__dso_handle'
}

rel=common
for i in libskia libssl libcrypto libutils libcutils libui libgui libhardware libmedia libandroid_runtime libbinder liblog libnativehelper libstagefright;do
	echo "// generated C file; do not modify; see dump-libs.sh" > $rel/$i.c
	for s in `dump_symbols $rel/$i.so`; do echo "void $s() {}" >> $rel/$i.c; done
done
