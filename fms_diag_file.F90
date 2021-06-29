module fms_diag_file_mod

use fms_diag_data_mod,   only: diag_data_type
use fms_diag_table_mod, only: diag_files_type
!! use fms2_io

implicit none

!!private
!!public fms_diag_file_type

type fms_diag_file_type

 character(len=:),allocatable :: file_fileobj       !< fms2_io file object
 character(len=:),allocatable :: fname            !< File name
 type (diag_files_type),allocatable :: diag_file    !< info from diag_table
 integer :: averaging_frequency                   !< The averaging frequency
 integer :: write_interval                        !< The interval for writing
 integer :: last_write_time                       !< The last time written
 integer :: next_write_time                       !< The next time to write
 class (diag_data_type), allocatable :: diag_data !< The data buffer object


end type fms_diag_file_type


end module fms_diag_file_mod
