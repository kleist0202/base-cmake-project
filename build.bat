@echo off

set PATH_TO_SCRIPT=%~dp0
set ROOT_DIR=%PATH_TO_SCRIPT%
set PATH_TO_MAKE=C:\msys64\ucrt64\bin\mingw32-make.exe
set PATH_TO_CMAKE="C:\Program Files\CMake\bin\cmake.exe"
::set PATH_TO_CXX_COMPILER=C:\msys64\ucrt64\bin\g++.exe

echo What type of build do you want to build?
echo 1. Debug
echo 2. Release
set /p CHOICE_VAR="Choose an option (1 or 2): "

::%PATH_TO_CMAKE% -G "MinGW Makefiles" -D "CMAKE_MAKE_PROGRAM:PATH=%PATH_TO_MAKE%" "CMAKE_CXX_COMPILER=:PATH=%PATH_TO_CXX_COMPILER%" -B %BUILD_DIR% -S . -DCMAKE_BUILD_TYPE=Debug


if "%CHOICE_VAR%"=="1" (
    echo Debug selected.
    set "BUILD_DIR=%ROOT_DIR%\build_debug"
    if not exist "%BUILD_DIR%" (
        mkdir "%BUILD_DIR%"
    )
    %PATH_TO_CMAKE% -G "MinGW Makefiles" -D "CMAKE_MAKE_PROGRAM:PATH=%PATH_TO_MAKE%" -B %BUILD_DIR% -S . -DCMAKE_BUILD_TYPE=Debug
    
    %PATH_TO_MAKE% -C %BUILD_DIR% -j %NUMBER_OF_PROCESSORS%
) else if "%CHOICE_VAR%"=="2" (
    echo Release selected.
    set "BUILD_DIR_RELEASE=%ROOT_DIR%\build_release"
    if not exist "%BUILD_DIR_RELEASE%" (
        mkdir "%BUILD_DIR_RELEASE%"
    )
    %PATH_TO_CMAKE% -G "MinGW Makefiles" -D "CMAKE_MAKE_PROGRAM:PATH=%PATH_TO_MAKE%" -B %BUILD_DIR_RELEASE% -S . -DCMAKE_BUILD_TYPE=Release
    
    %PATH_TO_MAKE% -C %BUILD_DIR_RELEASE% -j %NUMBER_OF_PROCESSORS%

) else (
    echo Wrong choice. Choose 1 or 2.
    exit /b 1
)