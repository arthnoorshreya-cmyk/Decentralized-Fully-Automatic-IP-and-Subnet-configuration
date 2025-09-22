@echo off
REM Build script for Dynamic IP and Subnet Configurator using MinGW

REM Create a new build directory specifically for MinGW
if not exist "build_mingw" mkdir build_mingw
cd build_mingw

REM Configure with MinGW generator
cmake -G "MinGW Makefiles" ..
if %ERRORLEVEL% neq 0 (
    echo CMake configuration failed. Please check your CMake and MinGW installation.
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
echo The executable can be found in: build_mingw\dynamic_ip_configurator.exe
echo.
pause