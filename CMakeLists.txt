cmake_minimum_required(VERSION 3.8.0)

project(SimplestProject VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB SOURCES src/*.cpp)

set(REPO_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

message(PROJECT_SOURCE_DIR="${REPO_ROOT_DIR}")

add_executable(${PROJECT_NAME}
    ${SOURCES}
)

if(GIT_FOUND)
    find_package(Git)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} describe --tags --abbrev=0
        OUTPUT_VARIABLE GIT_TAG
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
else()
    set(GIT_TAG "Unknown")
endif()

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release")
endif()

# Compiler-specific optimization/debug flags
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    # Release mode settings
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /O2")
    endif()
elseif(CMAKE_BUILD_TYPE STREQUAL "Debug")
    # Debug mode settings
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Zi")
    endif()
endif()

# Linker flags for release build (optional)
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")
endif()

set(PROJECT_VERSION ${GIT_TAG})

configure_file(${REPO_ROOT_DIR}/src/templateHeader/infoHeader.hpp.in ${REPO_ROOT_DIR}/src/infoHeader.hpp)

# target_link_libraries(${PROJECT_NAME} ...) 

message(PROJECT_NAME="${PROJECT_NAME}")
message(REPO_ROOT_DIR="${REPO_ROOT_DIR}")
message(PROJECT_VERSION="${PROJECT_VERSION}")
message(PROJECT_VERSION="${PROJECT_VERSION}")

set(CMAKE_INSTALL_PREFIX ${REPO_ROOT_DIR})

install(TARGETS ${PROJECT_NAME} DESTINATION bin)

# add_custom_target(run
#     COMMAND ${PROJECT_NAME}
#     DEPENDS ${PROJECT_NAME}
#     WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
# )
