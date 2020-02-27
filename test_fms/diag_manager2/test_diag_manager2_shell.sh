#!/bin/sh

# This is part of the GFDL FMS package. This is a shell script to
# execute tests in the test_fms/data_override directory.


# Set common test settings.
. ../test_common.sh

setup_test()
# Function sets up and runs the test 
# Inputs: 
# {1} Test number 
# {2} Description of test 
# {3} Set to "skip"

{
    echo ${2}
    tnum=$( printf "%2.2d" ${1} )
    rm -f diag_test_${tnum}* > /dev/null 2>&1
    sed "s/<test_num>/${tnum}/" $top_srcdir/test_fms/diag_manager2/input.nml_base > input.nml
    #ln -f -s $top_srcdir/test_fms/diag_manager/diagTables/diag_table_${tnum} diag_table

    run_test diag_manager2_test2 1 ${3}

}

rm -f input.nml diag_table
setup_test 1 "Test 1: Unstructured grid"
