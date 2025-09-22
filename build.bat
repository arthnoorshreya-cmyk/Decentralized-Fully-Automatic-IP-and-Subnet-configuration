

@echo off
REM Build script for Dynamic IP and Subnet Configurator

REM Create build directory if it doesn't exist
if not exist "build" mkdir build

REM Navigate to build directory
cd build

REM Generate build files with CMake
cmake ..
if %ERRORLEVEL% neq 0 (
    echo CMake configuration failed. Please check your CMake installation.
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
echo Would you like to run the application now? (Y/N)
set /p run_app=

if /i "%run_app%" == "Y" (
    echo Running application...
    Release\dynamic_ip_configurator.exe
) else (
    echo You can run the application later by executing: build\Release\dynamic_ip_configurator.exe
)

pause