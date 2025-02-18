#==========================================================================
#  http://www.gnu.org/software/autoconf-archive/ax_cxx_stlport_hashmap.html
#==========================================================================
#
# SYNOPSIS
#
#   AX_CXX_STLPORT_HASHMAP
#
# DESCRIPTION
#
#   Test for the presence of STLport's hashmap extension.
#
# LICENSE
#
#   Copyright (c) 2008 Patrick Mauritz <oxygene@studentenbude.ath.cx>
#
#   Copying & distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 6

AU_ALIAS([AC_CXX_STLPORT_HASHMAP],[AX_CXX_STLPORT_HASHMAP])
AC_DEFUN([AX_CXX_STLPORT_HASHMAP],[
AC_CACHE_CHECK(whether the compiler supports std::hash_map,
[ax_cv_cxx_stlport_hashmap],
[AC_LANG_PUSH([C++])
 AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
#include <hash_map>
using std::hash_map;
 ]])],
 [[]],
 [ax_cv_cxx_stlport_hashmap=yes],[ax_cv_cxx_stlport_hashmap=no])
 AC_LANG_POP
])
if test "$ax_cv_cxx_stlport_hashmap" = yes; then
  AC_DEFINE([HAVE_STLPORT_HASHMAP],[1],[Define to 1 if the compiler supports std::hash_map])
fi
])
