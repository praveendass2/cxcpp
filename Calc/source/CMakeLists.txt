#add_library(source Calc.cpp)

add_executable(${PROJECT_NAME}-exec Calc.cpp)

# Make sure the compiler can find include files for our Hello library
# when other libraries or executables link to Hello
# target_include_directories (Calc.cpp PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})


