SUBDIRS = src/module/
EXTRA_DIST = AUTHORS TODO README ChangeLog check doc src/*/*.hh src/*.hh

bin_PROGRAMS = _PROJECT_
_PROJECT__LDADD = \
    src/module/libXXX.a
_PROJECT__CXXFLAGS = \
    -Isrc/module/ \
    $(AM_CXXFLAGS)
_PROJECT__SOURCES = src/init.cc

check:
	check/not_found.py -a

doc:
	doxygen doc/Doxyfile

changelog : ChangeLog

ChangeLog :
	git log --graph --color > ChangeLog

clean-local:
	make -C doc/ clean

allclean: distclean
	rm -f _PROJECT_
	rm -f configure
	rm -f src/*/Makefile.in
	rm -f *.dot
	rm -f *.m4
	rm -rf *.cache
	rm -rf build-aux

.PHONY : doc check allclean all
