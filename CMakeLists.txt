project(pvr.hdhomerundvr)

cmake_minimum_required(VERSION 2.6)


set(CMAKE_VERBOSE_MAKEFILE on)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})

enable_language(CXX)

find_package(Kodi REQUIRED)
find_package(kodiplatform REQUIRED)
find_package(hdhomerun REQUIRED)
find_package(sqlite REQUIRED)

find_package(uuid REQUIRED)
find_package(curl REQUIRED)

include_directories(${kodiplatform_INCLUDE_DIRS}
                    ${p8-platform_LIBRARIES}
                    ${HDHOMERUN_INCLUDE_DIRS}
                    ${SQLITE_INCLUDE_DIRS}
                    ${CURL_INCLUDE_DIRS})

set(DEPLIBS ${kodiplatform_LIBRARIES}
            ${CURL_LIBRARIES})


file(GLOB PVRDVRHDHOMERUN_SOURCES src/*.cpp)
file(GLOB PVRDVRHDHOMERUN_HEADERS src/*.h)


if(WIN32)
  list(APPEND DEPLIBS ws2_32)
  list(APPEND DEPLIBS iphlpapi)
  if(CMAKE_SYSTEM_NAME STREQUAL WindowsStore)
    # if _WIN32_WINNT isn't defined before including hdhomerun.h then 
    # it's defined as _WIN32_WINNT_VISTA which breaks build on UWP
    add_definitions(-D_WIN32_WINNT=0x0A00)
  endif()
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /U_WINSOCKAPI_")
else()
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb")
endif()

build_addon(pvr.dvr.hdhomerun PVRDVRHDHOMERUN DEPLIBS)

include(CPack)

