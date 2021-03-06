#!/bin/sh

TARGET=amd64
TARGET_ARCH=amd64

export MAKEOBJDIRPREFIX=${WORKSPACE}/obj
rm -fr ${MAKEOBJDIRPREFIX}

MAKECONF=${MAKECONF:-/dev/null}
SRCCONF=${SRCCONF:-/dev/null}

cd ${WORKSPACE}/src

make -j ${BUILDER_JFLAG} -DNO_CLEAN \
	buildworld \
	TARGET=${TARGET} \
	TARGET_ARCH=${TARGET_ARCH} \
	CROSS_TOOLCHAIN=amd64-gcc \
	__MAKE_CONF=${MAKECONF} \
	SRCCONF=${SRCCONF}
make -j ${BUILDER_JFLAG} -DNO_CLEAN \
	buildkernel \
	TARGET=${TARGET} \
	TARGET_ARCH=${TARGET_ARCH} \
	CROSS_TOOLCHAIN=amd64-gcc \
	__MAKE_CONF=${MAKECONF} \
	SRCCONF=${SRCCONF}
