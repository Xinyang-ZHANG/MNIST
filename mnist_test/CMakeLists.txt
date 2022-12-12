cmake_minimum_required(VERSION 3.16)
project(mnist_test)

set(CMAKE_CXX_STANDARD 14)

add_executable(mnist_test main.cpp)

MATH(EXPR stack_size "256 * 1024 * 1024") # 256 Mb
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--stack,${stack_size}")