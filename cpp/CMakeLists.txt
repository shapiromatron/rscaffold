# CMakeLists.txt
cmake_minimum_required(VERSION 3.0)

project(add)

# Add the library target
add_library(add STATIC add.cpp)

# Add the executable target for the tests
add_executable(test_add test_add.cpp)

# Link the library to the test executable
target_link_libraries(test_add add)

# Enable code coverage analysis
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")

# Add a custom target for generating coverage report
add_custom_target(coverage
    COMMAND ${CMAKE_COMMAND} -E env "LCOV_EXCL_BR_LINE=:${PROJECT_SOURCE_DIR}/test/*" gcov -b ${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/CMakeFiles/test_add.dir/test_add.cpp.gcno
    COMMAND lcov -d ${PROJECT_SOURCE_DIR} -c -o ${PROJECT_SOURCE_DIR}/coverage.info
    COMMAND lcov -r ${PROJECT_SOURCE_DIR}/coverage.info "${PROJECT_SOURCE_DIR}/test/*" -o ${PROJECT_SOURCE_DIR}/coverage.info
    COMMAND genhtml ${PROJECT_SOURCE_DIR}/coverage.info -o ${PROJECT_SOURCE_DIR}/coverage
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    COMMENT "Generating code coverage report"
)

# Add a custom target for executing tests and generating coverage report
add_custom_target(run_tests
    COMMAND ./test_add
    DEPENDS test_add
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
    COMMENT "Running tests and generating code coverage report"
)


# Add a custom target for executing tests, generating coverage data, and generating HTML report
add_custom_target(run_tests_with_coverage
    COMMAND ./test_add
    COMMAND ${CMAKE_COMMAND} -E env "LCOV_EXCL_BR_LINE=:${PROJECT_SOURCE_DIR}/test/*" gcov -b ${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/CMakeFiles/test_add.dir/test_add.cpp.gcno
    COMMAND lcov -d ${PROJECT_SOURCE_DIR} -c -o ${PROJECT_SOURCE_DIR}/coverage.info --ignore-errors unused
    COMMAND lcov -r ${PROJECT_SOURCE_DIR}/coverage.info "${PROJECT_SOURCE_DIR}/test/*" -o ${PROJECT_SOURCE_DIR}/coverage.info --ignore-errors unused
    COMMAND genhtml ${PROJECT_SOURCE_DIR}/coverage.info -o ${PROJECT_SOURCE_DIR}/coverage
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
    COMMENT "Running tests, generating coverage data, and generating HTML report"
)
