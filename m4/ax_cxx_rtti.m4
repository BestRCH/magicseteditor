#==========================================================================
#       http://www.gnu.org/software/autoconf-archive/ax_cxx_rtti.html
#==========================================================================
#
# SYNOPSIS
#
#   AX_CXX_RTTI
#
# DESCRIPTION
#
#   If the compiler supports Run-Time Type Identification (typeinfo header
#   and typeid keyword), define HAVE_RTTI.
#
# LICENSE
#
#   Copyright (c) 2008 Todd Veldhuizen
#   Copyright (c) 2008 Luc Maisonobe <luc@spaceroots.org>
#
#   Copying & distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 6

AU_ALIAS([AC_CXX_RTTI],[AX_CXX_RTTI])
AC_DEFUN([AX_CXX_RTTI],
[AC_CACHE_CHECK([whether the compiler supports Run-Time Type Identification],
[ax_cv_cxx_rtti],
[AC_LANG_PUSH([C++])
 AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
#include <typeinfo>
class Base { public :
             Base () {}
             virtual int f () { return 0; }
           };
class Derived : public Base { public :
                              Derived () {}
                              virtual int f () { return 1; }
                            };
]],[[Derived d;
Base *ptr = &d;
return typeid (*ptr) == typeid (Derived);
]])],
 [ax_cv_cxx_rtti=yes],[ax_cv_cxx_rtti=no])
 AC_LANG_POP
])
if test "$ax_cv_cxx_rtti" = yes; then
  AC_DEFINE([HAVE_RTTI],[1],
            [Define to 1 if the compiler supports Run-Time Type Identification])
fi
])
