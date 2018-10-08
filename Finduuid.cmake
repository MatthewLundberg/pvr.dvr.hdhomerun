find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
  pkg_check_modules (UUID uuid)
endif()

if(NOT UUID_FOUND)
  find_path(UUID_INCLUDE_DIRS uuid.h
            PATH_SUFFIXES uuid libuuid)
  find_library(UUID_LIBRARIES uuid)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(uuid DEFAULT_MSG UUID_LIBRARIES UUID_INCLUDE_DIRS)

mark_as_advanced(UUID_INCLUDE_DIRS UUID_LIBRARIES)
