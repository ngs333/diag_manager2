module fms_diag_data_mod

use iso_c_binding
use fms_diag_util_mod, only: diag_error, diag_null
use fms_diag_util_mod, only: fatal,note,warning

implicit none
private

public :: diag_data_type
!> \brief Base type of the diagnostic data
type diag_data_type 

     integer :: ndims !< The number of dimensions of the data

end type diag_data_type 
!> \brief Type entending diag_data_type for scalar data
type, extends(diag_data_type) :: diag_data_scalar
     class(*), allocatable :: ddata !< buffer for the data
end type diag_data_scalar
!> \brief Type entending diag_data_type for 1d data
type, extends(diag_data_type) ::  diag_data_1d
     class(*), allocatable :: ddata (:)!< buffer for the data
end type diag_data_1d
!> \brief Type entending diag_data_type for 2d data
type, extends(diag_data_type) ::  diag_data_2d
     class(*), allocatable :: ddata (:,:)!< buffer for the data
end type diag_data_2d
!> \brief Type entending diag_data_type for 3d data
type, extends(diag_data_type) ::  diag_data_3d
     class(*), allocatable :: ddata (:,:,:)!< buffer for the data
end type diag_data_3d
!> \brief Type entending diag_data_type for 4d data
type, extends(diag_data_type) ::  diag_data_4d
     class(*), allocatable :: ddata (:,:,:,:)!< buffer for the data
end type diag_data_4d
!> \brief Type entending diag_data_type for 5d data
type, extends(diag_data_type) ::  diag_data_5d
     class(*), allocatable :: ddata (:,:,:,:,:)!< buffer for the data
end type diag_data_5d




end module fms_diag_data_mod
