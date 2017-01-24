context("install_pkgs")

test_that("install deps", {
  u_desc <- 'https://raw.githubusercontent.com/curso-r/verao2017/master/DESCRIPTION'
  expect_true(pu_install_deps(u_desc))
})
