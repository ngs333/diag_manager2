# This is an automake file for the diag_manager directory of the FMS
# package.

# Ed Hartnett 2/22/19

# Include .h and .mod files.
AM_CPPFLAGS = -I${top_srcdir}/include
AM_CPPFLAGS += -I${top_builddir}/mpp
AM_CPPFLAGS += -I${top_builddir}/fms
AM_CPPFLAGS += -I${top_builddir}/fms2_io
AM_CPPFLAGS += -I${top_builddir}/time_manager
AM_CPPFLAGS += -I${top_builddir}/constants
AM_CPPFLAGS += -I${top_builddir}/axis_utils

# Build these uninstalled convenience libraries.
noinst_LTLIBRARIES = libdiag_util.la libdiag_file.la \
libdiag_data.la  libdiag_averaging.la libdiag_c2fortran.la \
libdiag_table.la libdiag_concur.la libdiag_axis.la \
libdiag_object.la libdiag_send.la libdiag_register.la \
libdiag_manager2.la libdiag_manager2_c.la 


# Each convenience library depends on its source.
libdiag_util_la_SOURCES = fms_diag_util.F90
libdiag_file_la_SOURCES = fms_diag_file.F90
libdiag_data_la_SOURCES = fms_diag_data.F90
libdiag_averaging_la_SOURCES = fms_diag_averaging.F90
libdiag_c2fortran_la_SOURCES = fms_diag_c2fortran.F90
libdiag_table_la_SOURCES = fms_diag_table.F90
libdiag_concur_la_SOURCES = fms_diag_concur.F90
libdiag_axis_la_SOURCES = fms_diag_axis.F90
libdiag_object_la_SOURCES = fms_diag_object.F90
libdiag_send_la_SOURCES = fms_diag_send_data.F90
libdiag_register_la_SOURCES = fms_diag_register.F90
libdiag_manager2_la_SOURCES = fms_diag_manager2.F90
libdiag_manager2_c_la_SOURCES = fms_diag_parse.c fms_diag_parser.h

fms_diag_parse.o: fms_diag_parse.c

# Each mod file depends on the .o file.
fms_diag_util_mod.mod: fms_diag_util.$(OBJEXT)
fms_diag_file_mod.mod: fms_diag_file.$(OBJEXT)
fms_diag_data_mod.mod: fms_diag_data.$(OBJEXT)
fms_diag_averaging_mod.mod: fms_diag_averaging.$(OBJEXT)
fms_diag_c2fortran_mod.mod: fms_diag_c2fortran.$(OBJEXT)
fms_diag_table_mod.mod: fms_diag_table.$(OBJEXT)
fms_diag_concur_mod.mod: fms_diag_concur.$(OBJEXT)
fms_diag_axis_mod.mod: fms_diag_axis.$(OBJEXT)
fms_diag_object_mod.mod: fms_diag_object.$(OBJEXT)
fms_diag_send_data_mod.mod: fms_diag_send_data.$(OBJEXT)
fms_diag_register_mod.mod: fms_diag_register.$(OBJEXT)
fms_diag_manager2_mod.mod: fms_diag_manager2.$(OBJEXT)


# Some mods are dependant on other mods in this dir.
fms_diag_data.$(OBJEXT): fms_diag_util_mod.mod
fms_diag_table.$(OBJEXT): fms_diag_data_mod.mod fms_diag_c2fortran_mod.mod
fms_diag_concur.$(OBJEXT): fms_diag_data_mod.mod
fms_diag_axis.$(OBJEXT): fms_diag_data_mod.mod
fms_diag_object.$(OBJEXT): fms_diag_data_mod.mod fms_diag_table_mod.mod fms_diag_util_mod.mod fms_diag_axis_mod.mod fms_diag_file_mod.mod
fms_diag_send_data.$(OBJEXT): fms_diag_data_mod.mod fms_diag_averaging_mod.mod fms_diag_object_mod.mod
fms_diag_register.$(OBJEXT): fms_diag_data_mod.mod fms_diag_concur_mod.mod fms_diag_table_mod.mod fms_diag_send_data_mod.mod fms_diag_object_mod.mod  
fms_diag_manager2.$(OBJEXT): fms_diag_data_mod.mod fms_diag_concur_mod.mod fms_diag_table_mod.mod fms_diag_object_mod.mod fms_diag_send_data_mod.mod fms_diag_register_mod.mod


# Mod files are built and then installed as headers.
MODFILES = fms_diag_data_mod.mod fms_diag_util_mod.mod fms_diag_averaging_mod.mod \
fms_diag_c2fortran_mod.mod fms_diag_table_mod.mod fms_diag_concur_mod.mod \
fms_diag_axis_mod.mod fms_diag_object_mod.mod fms_diag_send_data_mod.mod \
fms_diag_register_mod.mod fms_diag_manager2_mod.mod 
include_HEADERS = $(MODFILES)
BUILT_SOURCES = $(MODFILES)

CLEANFILES = *.mod
