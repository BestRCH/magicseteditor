#==========================================================================
# http://www.gnu.org/software/autoconf-archive/ax_cxx_header_pre_stdcxx.html
#==========================================================================
#
# SYNOPSIS
#
#   AX_CXX_HEADER_PRE_STDCXX
#
# DESCRIPTION
#
#   Check whether pre-ISO-C++ headers exist.
#
# LICENSE
#
#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
#
#   Copying & distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 6

AU_ALIAS([AC_CXX_HEADER_PRE_STDCXX],[AX_CXX_HEADER_PRE_STDCXX])
AC_DEFUN([AX_CXX_HEADER_PRE_STDCXX],[
  AC_CACHE_CHECK(for pre-ISO C++ include files,
  [ax_cv_cxx_pre_stdcxx],
  [AC_LANG_PUSH([C++])
  ac_save_CXXFLAGS="$CXXFLAGS"
  CXXFLAGS="$CXXFLAGS -Wno-deprecated"

  # Omit defalloc.h, as compilation with newer compilers is problematic.
  AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
  #include <new.h>
  #include <iterator.h>
  #include <alloc.h>
  #include <set.h>
  #include <hashtable.h>
  #include <hash_set.h>
  #include <fstream.h>
  #include <tempbuf.h>
  #include <istream.h>
  #include <bvector.h>
  #include <stack.h>
  #include <rope.h>
  #include <complex.h>
  #include <ostream.h>
  #include <heap.h>
  #include <iostream.h>
  #include <function.h>
  #include <multimap.h>
  #include <pair.h>
  #include <stream.h>
  #include <iomanip.h>
  #include <slist.h>
  #include <tree.h>
  #include <vector.h>
  #include <deque.h>
  #include <multiset.h>
  #include <list.h>
  #include <map.h>
  #include <algobase.h>
  #include <hash_map.h>
  #include <algo.h>
  #include <queue.h>
  #include <streambuf.h>
  ]],[[]])],
  [ax_cv_cxx_pre_stdcxx=yes],[ax_cv_cxx_pre_stdcxx=no])
  CXXFLAGS="$ac_save_CXXFLAGS"
  AC_LANG_POP
  ])
  if test "$ax_cv_cxx_pre_stdcxx" = yes; then
    AC_DEFINE([PRE_STDCXX_HEADERS],[1],[Define to 1 if pre-ISO C++ header files are present. ])
  fi
])
