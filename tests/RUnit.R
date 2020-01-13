if (requireNamespace("RUnit", quietly=TRUE) && requireNamespace("RcppXPtrUtils", quietly=TRUE)) {
    #&& requireNamespace("RcppArmadillo", quietly=TRUE)
   library(RUnit)
   library(RcppXPtrUtils)

   testSuite <- defineTestSuite(
      name = "testarma1 unit tests",
      dirs = system.file("unitTests", package = "testarma2"),
      testFuncRegexp = "^[Tt]est.+"
   )
   Sys.setenv("R_TESTS"="")
   tests <- runTestSuite(testSuite)

   printTextProtocol(tests)

   if (getErrors(tests)$nFail > 0) stop("RUnit test failure")
   if (getErrors(tests)$nErr > 0) stop("Errors in RUnit tests")
}
