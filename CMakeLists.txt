
cmake_minimum_required(VERSION 3.24)

project(velox-bench)

add_executable(main main.cpp)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(TREAT_WARNINGS_AS_ERRORS OFF)
set(VELOX_BUILD_TESTING OFF)
set(ENV{INSTALL_PREFIX} "${CMAKE_CURRENT_LIST_DIR}/deps-install")
add_subdirectory(velox)