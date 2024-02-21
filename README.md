# base-cmake-project
Ideal starting point for project.

## Instruction for linux
In root directory type commands:
### Compilation for debug mode:

`cmake -S . -B build_debug -DCMAKE_BUILD_TYPE=Debug`

### Compilation for release mode:

`cmake -S . -B build_release -DCMAKE_BUILD_TYPE=Release`

#### Then cd to chosen build directory and:

`make install`

#### To run project:

`./bin/Simplestproject`

### Or you can use prepared script to automatize this process:

`./scripts/build.sh`
