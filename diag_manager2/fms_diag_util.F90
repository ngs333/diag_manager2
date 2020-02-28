module fms_diag_util_mod
use mpi !> Fortran 2018 style for mpi
implicit none
!> Miscellanoeous utility functions.

public :: fatal, note, warning, diag_error
public :: diag_null

integer :: fatal=-143, note=143, warning=143*2
integer, parameter :: diag_null = -999
integer, parameter :: diag_not_found = -1
integer, parameter :: diag_not_registered = 0
integer, parameter :: diag_registered_id = 10
!> Supported averaging intervals
integer, parameter :: monthly = 30
integer, parameter :: daily = 24 
integer, parameter :: diurnal = 2
integer, parameter :: yearly = 12
integer, parameter :: no_diag_averaging = 0
integer, parameter :: instantaneous = 0
integer, parameter :: three_hourly = 3
integer, parameter :: six_hourly = 6
!integer, parameter :: seasonally = 180
!> Supported type/kind of the variable
!integer, parameter :: r16=16
integer, parameter :: r8 = 8
integer, parameter :: r4 = 4
integer, parameter :: i8 = -8
integer, parameter :: i4 = -4
integer, parameter :: string = 19 !< s is the 19th letter of the alphabet
integer, parameter :: null_type_int = -999

contains

!> \brief Wrapper for error routine to be used.
subroutine diag_error(sub,mess,lev,mycomm)
character(len=*), intent(in)  :: sub
character(len=*), intent(in)  :: mess
integer, intent(in)           :: lev
integer, intent(in), optional :: mycomm
character(len=15)             :: slev
logical                       :: mpi_on
integer                       :: ierr
integer                       :: comm
integer                       :: rk
mpi_on = .false.
if (lev == note) then
     slev = "NOTE: "
     call mpi_initialized(mpi_on,ierr)
elseif (lev == WARNING) then
     slev = "WARNING: "
else
     slev = "FATAL: "
endif

if (lev == note .and. mpi_on) then
     if (present(mycomm)) then
          comm = mycomm
     else
          comm = MPI_COMM_WORLD
     endif
     call mpi_comm_rank(comm, rk, ierr)
     if (rk == 0) then
          write (6,*)trim(slev)//sub,":: ",mess
     endif
else
     write (6,*)trim(slev)//sub,":: ",mess
endif

if (lev==fatal) then
  if (mpi_on) then
     call MPI_ABORT(MPI_COMM_WORLD,-1,ierr)
  else
     stop
  endif
endif

end subroutine diag_error

!> Make and return a string (character array) representation of an integer
function int_to_cs(i) result(res)
    character(:),allocatable :: res
    integer,intent(in) :: i
    character(range(i)+2) :: tmp
    write(tmp,'(i0)') i
    res = trim(tmp)
end function int_to_cs

  !> Make and return a string (character array) representation of a logcal
function logical_to_cs(ii) result(res)
    character(:),allocatable :: res
    logical ,intent(in) :: ii
    character(1) :: tmp
    if (ii) then
        res = "T"
    else
        res = "F"
    end if
 end function logical_to_cs

end module fms_diag_util_mod



