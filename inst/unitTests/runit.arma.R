# pointer to example function f1()
includes <- "using namespace arma;\n#include <r2sundials.h>"
pf <- cppXPtr(code='
vec f1(vec &x) {
  return(x+CV_SUCCESS+1);
}
', depends=c("RcppArmadillo", "r2sundials", "rmumps"), includes=includes, cacheDir="lib", verbose=FALSE)
print(pf)
test.ptr <- function() {
  checkXPtr(pf, "vec", "vec&")
}
