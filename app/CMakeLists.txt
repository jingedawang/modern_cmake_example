cmake_minimum_required(VERSION 3.5)
project(MyLibraryApp VERSION 1.0.0 LANGUAGES CXX)

find_package(MyLibrary REQUIRED)

## Create the executable target
add_executable(App main.cpp)
target_compile_features(App PRIVATE cxx_std_11)
target_link_libraries(App PRIVATE MyLibrary::MyLibrary)