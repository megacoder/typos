TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::	typo

${TARGETS}::

clobber distclean:: clean

check::	typo
	./typo ${ARGS}

install:: typo
	${INSTALL} -D typo ${BINDIR}/typo

uninstall::
	${RM} ${BINDIR}/typo

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
