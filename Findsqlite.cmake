find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
  pkg_check_modules (SQLITE sqlite)
endif()

if(NOT SQLITE_FOUND)
  find_path(SQLITE_INCLUDE_DIRS sqlite3.h
            PATH_SUFFIXES include sqlite libsqlite)
  find_library(SQLITE_LIBRARIES sqlite3)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(sqlite DEFAULT_MSG SQLITE_LIBRARIES SQLITE_INCLUDE_DIRS)

mark_as_advanced(SQLITE_INCLUDE_DIRS SQLITE_LIBRARIES)
