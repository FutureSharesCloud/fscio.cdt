# Toolchain config for iOS.

SET(CMAKE_SYSTEM_NAME Darwin)
SET(CMAKE_SYSTEM_VERSION 13)
SET(CMAKE_CXX_COMPILER_WORKS True)
SET(CMAKE_C_COMPILER_WORKS True)
SET(IOS True)

if(NOT CMAKE_OSX_SYSROOT)
  execute_process(COMMAND xcodebuild -version -sdk iphonfsc Path
    OUTPUT_VARIABLE SDKROOT
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE)

  IF(NOT EXISTS ${SDKROOT})
    MESSAGE(FATAL_ERROR "SDKROOT could not be detected!")
  ENDIF()

  message(STATUS "Using SDKROOT ${SDKROOT}")
  set(CMAKE_OSX_SYSROOT ${SDKROOT})
endif()

IF(NOT CMAKE_C_COMPILER)
  execute_process(COMMAND xcrun -sdk ${CMAKE_OSX_SYSROOT} -find clang
   OUTPUT_VARIABLE CMAKE_C_COMPILER
   ERROR_QUIET
   OUTPUT_STRIP_TRAILING_WHITESPACE)
  message(STATUS "Using c compiler ${CMAKE_C_COMPILER}")
ENDIF()

IF(NOT CMAKE_CXX_COMPILER)
  execute_process(COMMAND xcrun -sdk ${CMAKE_OSX_SYSROOT} -find clang++
   OUTPUT_VARIABLE CMAKE_CXX_COMPILER
   ERROR_QUIET
   OUTPUT_STRIP_TRAILING_WHITESPACE)
  message(STATUS "Using c compiler ${CMAKE_CXX_COMPILER}")
ENDIF()

IF(NOT CMAKE_AR)
  execute_process(COMMAND xcrun -sdk ${CMAKE_OSX_SYSROOT} -find ar
   OUTPUT_VARIABLE CMAKE_AR_val
   ERROR_QUIET
   OUTPUT_STRIP_TRAILING_WHITESPACE)
  SET(CMAKE_AR ${CMAKE_AR_val} CACHE FILEPATH "Archiver")
  message(STATUS "Using ar ${CMAKE_AR}")
ENDIF()

IF(NOT CMAKE_RANLIB)
  execute_process(COMMAND xcrun -sdk ${CMAKE_OSX_SYSROOT} -find ranlib
   OUTPUT_VARIABLE CMAKE_RANLIB_val
   ERROR_QUIET
   OUTPUT_STRIP_TRAILING_WHITESPACE)
  SET(CMAKE_RANLIB ${CMAKE_RANLIB_val} CACHE FILEPATH "Ranlib")
  message(STATUS "Using ranlib ${CMAKE_RANLIB}")
ENDIF()
