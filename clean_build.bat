@echo off
REM Clean build script for Dynamic IP and Subnet Configurator

REM Clean previous build files
if exist "build" (
    echo Cleaning previous build files...
    rmdir /s /q "build"
)

REM Create fresh build directory
mkdir build
cd build

REM Configure with Visual Studio generator
cmake -G "Visual Studio 17 2022" -A x64 ..
if %ERRORLEVEL% neq 0 (
    echo CMake configuration failed. Please check your CMake and Visual Studio installation.
    pause
    exit /b %ERRORLEVEL%
)

REM Build the project
cmake --build . --config Release
if %ERRORLEVEL% neq 0 (
    echo Build failed. Please check the error messages above.
    pause
    exit /b %ERRORLEVEL%
)

REM Navigate back to project root
echo.
echo Build completed successfully!
echo The executable can be found in: build\Release\dynamic_ip_configurator.exe
echo.
pause