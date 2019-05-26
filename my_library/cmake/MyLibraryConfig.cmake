## Get the directory path of the <target>.cmake file
get_filename_component(MyLibrary_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" DIRECTORY)

## Add the dependencies of our library
include(CMakeFindDependencyMacro)
find_dependency(OpenCV REQUIRED)

## Import the targets
if(NOT TARGET MyLibrary::MyLibrary)
    include("${MyLibrary_CMAKE_DIR}/MyLibraryTargets.cmake")
endif()