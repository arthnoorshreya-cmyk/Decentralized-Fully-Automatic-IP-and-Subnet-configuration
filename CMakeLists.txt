# CMakeLists.txt for Dynamic IP and Subnet Configurator

# Minimum CMake version required
cmake_minimum_required(VERSION 3.10)

# Project name and version
project(DynamicIpSubnetConfigurator VERSION 1.0)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add source files
set(SOURCES
    src/network_configurator.cpp
    src/main.cpp
)

# Add header files
set(HEADERS
    src/network_configurator.h
)

# Create executable
add_executable(dynamic_ip_configurator ${SOURCES} ${HEADERS})

# Specify include directories
target_include_directories(dynamic_ip_configurator PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Link against required libraries
if(WIN32)
    # For Windows, link against Winsock and IP Helper libraries
    target_link_libraries(dynamic_ip_configurator PRIVATE ws2_32 iphlpapi)
else()
    # For Linux/Unix, add appropriate libraries if needed
    # Example: target_link_libraries(dynamic_ip_configurator PRIVATE pthread)
endif()

# Set compiler options
if(MSVC)
    # Microsoft Visual C++ specific options
    target_compile_options(dynamic_ip_configurator PRIVATE /W4 /WX)
else()
    # GCC/Clang specific options
    target_compile_options(dynamic_ip_configurator PRIVATE -Wall -Wextra -Wpedantic -Werror)
endif()

# Installation configuration
install(TARGETS dynamic_ip_configurator
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

# Optional: CPack configuration for creating installers
include(CPack)
set(CPACK_PACKAGE_NAME "DynamicIpSubnetConfigurator")
set(CPACK_PACKAGE_VERSION "1.0.0")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Dynamic IP and Subnet Configurator for Highly Mobile Ad Hoc Networks")
set(CPACK_PACKAGE_CONTACT "developer@example.com")

# For Windows NSIS installer
if(WIN32)
    set(CPACK_GENERATOR "NSIS")
    set(CPACK_NSIS_DISPLAY_NAME "Dynamic IP and Subnet Configurator")
    set(CPACK_NSIS_URL_INFO_ABOUT "https://example.com")
endif()