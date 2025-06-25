
cmake_minimum_required(VERSION 3.24)

project(velox-bench)

add_executable(main main.cpp)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(TREAT_WARNINGS_AS_ERRORS OFF)
set(VELOX_BUILD_TESTING OFF)
set(ENV{INSTALL_PREFIX} "${CMAKE_CURRENT_LIST_DIR}/deps-install")
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ENV{INSTALL_PREFIX})
add_subdirectory(velox)
include_directories(velox)

find_package(benchmark REQUIRED)
find_package(folly REQUIRED)
find_package(gflags REQUIRED)

target_link_libraries(main PRIVATE benchmark::benchmark)
target_link_libraries(main PRIVATE
  velox_core
  velox_exec
  velox_presto_serializer
  velox_vector
  velox_row_fast
  velox_buffer
  Folly::folly
  gflags::gflags
)