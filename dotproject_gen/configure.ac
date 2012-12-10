AC_INIT([_PROJECT_], [1.0])
AC_CONFIG_AUX_DIR(build-aux)

AC_CONFIG_FILES(Makefile
                src/module/Makefile)

AM_CXXFLAGS="-Wall -Wextra -Werror -std=c++0x -pedantic"

AC_ARG_WITH([debug])
AC_ARG_WITH([clang])

if test "$with_clang" = "yes"; then
    CXX="clang++"
fi

if test "$with_debug" = "yes"; then
    AC_MSG_NOTICE("Adding debug flags")
    CXXFLAGS="$AM_CXXFLAGS -O0 -DDEBUG -g -ggdb"
else
    CXXFLAGS="$AM_CXXFLAGS -DNODEBUG"
fi

PYTHON='python'

AC_PROG_CXX
AC_PROG_RANLIB
AC_SUBST([PYTHON])
AC_SUBST([AM_CXXFLAGS])

AM_INIT_AUTOMAKE(foreign -Wall)

AC_OUTPUT
