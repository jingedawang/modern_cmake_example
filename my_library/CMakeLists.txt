cmake_minimum_required(VERSION 3.5)
project(MyLibrary VERSION 1.0.0 LANGUAGES CXX)

find_package(OpenCV REQUIRED)

## Add an empty library first. Then set properties for it.
add_library(MyLibrary)
target_compile_features(MyLibrary PRIVATE cxx_std_11)
target_sources(MyLibrary PRIVATE src/my_library.cpp)
target_include_directories(MyLibrary
        PUBLIC
            $<INSTALL_INTERFACE:include>
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        PRIVATE
            ${OpenCV_INCLUDE_DIRS}
        )
target_link_libraries(MyLibrary PRIVATE ${OpenCV_LIBRARIES})

## We firstly install the generated libraries to /usr/local. The path
## comes from GNUInstallDirs, which includes lots of predefined system
## paths.
include(GNUInstallDirs)
install(TARGETS MyLibrary
        EXPORT MyLibraryTargets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        )

## Then we install the auto-generated target file, in which have many
## exported names and paths of our target.
install(EXPORT MyLibraryTargets
        FILE MyLibraryTargets.cmake
        NAMESPACE MyLibrary::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyLibrary)

## And we should install the header files.
install(DIRECTORY include/
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )

## Finally, install the <package>Config.cmake file, which is provided
## for users.
install(FILES ${CMAKE_CURRENT_LIST_DIR}/cmake/MyLibraryConfig.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyLibrary)