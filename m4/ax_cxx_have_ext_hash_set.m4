#==========================================================================
# http://www.gnu.org/software/autoconf-archive/ax_cxx_have_ext_hash_set.html
#==========================================================================
#
# SYNOPSIS
#
#   AX_CXX_HAVE_EXT_HASH_SET
#
# DESCRIPTION
#
#   Check if the compiler has ext/hash_set Eg:
#
#     #if defined(HAVE_EXT_HASH_SET)
#     # include <ext/hash_set>
#     #else
#     # if defined(HAVE_STL)
#     #  include <hash_set>
#     # else
#     #   Cannot find hash_set header !
#     # endif /* HAVE_STL */
#     #endif /* HAVE_EXT_HASH_SET */
#
# LICENSE
#
#   Copyright (c) 2008 Alain BARBET <alian@cpan.org>
#
#   This program is free software; you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation; either version 2 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GPL
#   for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <http://www.gnu.org/licenses/>.
#
#   As a special exception, the respective Autoconf Macro's copyright owner
#   gives unlimited permission to copy, distribute and modify the configure
#   scripts that are the output of Autoconf when processing the Macro. You
#   need not follow the terms of the GNU General Public License when using
#   or distributing such scripts, even though portions of the text of the
#   Macro appear in them. The GNU General Public License (GPL) does govern
#   all other use of the material that constitutes the Autoconf Macro.
#
#   This special exception to the GPL applies to versions of the Autoconf
#   Macro released by the Autoconf Archive. When you make and distribute a
#   modified version of the Autoconf Macro, you may extend this special
#   exception to the GPL to apply to your modified version as well.

#serial 5

AU_ALIAS([AC_CXX_HAVE_EXT_HASH_SET],[AX_CXX_HAVE_EXT_HASH_SET])
AC_DEFUN([AX_CXX_HAVE_EXT_HASH_SET],
[AC_CACHE_CHECK([whether the compiler has ext/hash_set],
[ax_cv_cxx_have_ext_hash_set],
[AC_REQUIRE([AX_CXX_NAMESPACES])
  AC_LANG_PUSH([C++])
  AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
#include <ext/hash_set>
#ifdef HAVE_NAMESPACES
using namespace std;
#endif
  ]],[[
hash_set<int> t; return 0;
  ]])],
  [ax_cv_cxx_have_ext_hash_set=yes],[ax_cv_cxx_have_ext_hash_set=no])
  AC_LANG_POP
])
if test "$ax_cv_cxx_have_ext_hash_set" = yes; then
   AC_DEFINE([HAVE_EXT_HASH_SET],[1],[Define to 1 if the compiler has ext/hash_set])
fi
])
