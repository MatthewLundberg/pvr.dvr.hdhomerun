find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
  pkg_check_modules (CURL curl)
endif()

if(NOT CURL_FOUND)
  find_path(CURL_INCLUDE_DIRS curl.h
            PATH_SUFFIXES curl libcurl)
  find_library(CURL_LIBRARIES curl)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(curl DEFAULT_MSG CURL_LIBRARIES CURL_INCLUDE_DIRS)

mark_as_advanced(CURL_INCLUDE_DIRS CURL_LIBRARIES)
