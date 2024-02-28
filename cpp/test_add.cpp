// test_add.cpp
#include "add.h"
#include <cassert>

int main() {
    // Test cases
    assert(add(1, 2) == 3);
    assert(add(-1, 2) == 1);
    assert(add(0, 0) == 0);

    return 0;
}
