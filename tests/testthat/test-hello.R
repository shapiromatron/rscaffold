testthat::test_that("addition", {
    testthat::expect_true(addition(1, 2) == 3)
    testthat::expect_identical(addition(1, c(2, 3)), c(3, 4))
})

testthat::test_that("square", {
    testthat::expect_true(square(4) == 16)
})
