# This is an automake file for the test_fms/diag_manager directory of the FMS
# package.
# NOTE: Please see the version created for diag_manager #1

# Find the needed mod and .inc files.
AM_CPPFLAGS = -I${top_srcdir}/include \
  -I${top_builddir}/mpp	\
  -I${top_builddir}/fms \
  -I${top_builddir}/diag_manager2 \
  -I${top_builddir}/constants

# Link to the FMS library.
LDADD = ${top_builddir}/libFMS/libFMS.la

# Build this test program.
check_PROGRAMS = diag_manager2_test2

# This is the source code for the test.
diag_manager2_test2_SOURCES = diag_manager2_test2.F90

# Run the test.
TESTS = test_diag_manager2_shell.sh

# Copy over other needed files to the srcdir
EXTRA_DIST = input.nml_base test_diag_manager2_shell.sh

CLEANFILES = input.nml *.nc *.out diag_table
