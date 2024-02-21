#include <iostream>

int main(int argc, char *argv[]) {
    #ifdef NDEBUG
        std::cout << "Running in Release Mode" << std::endl;
    #else
        std::cout << "Running in Debug Mode" << std::endl;
    #endif

    #ifndef NDEBUG
        std::cout << "Debugging information is enabled" << std::endl;
    #else
        std::cout << "Debugging information is disabled" << std::endl;
    #endif

    return 0;
}
