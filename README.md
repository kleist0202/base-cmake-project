# base-cmake-project
Ideal starting point for project.

## Instruction for windows
In root directory type commands:
### Compilation for debug mode:

`cmake -S . -B build_debug -DCMAKE_BUILD_TYPE=Debug`

### Compilation for release mode:

`cmake -S . -B build_release -DCMAKE_BUILD_TYPE=Release`

#### Then build with chosen directory:

`mingw32-make -C build_debug`

#### To run project:

`Simplestproject.exe`

### Or you can use prepared script to automatize this process:

`build.bat`
