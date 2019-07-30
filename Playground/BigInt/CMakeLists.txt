cmake_minimum_required(VERSION 3.13)
enable_language(C)

project(BigInt)

set(CMAKE_C_STANDARD 99)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(BigInt "main.c" "bigint.c")
target_link_libraries(BigInt m)
