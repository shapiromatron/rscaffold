# RScaffold

An opinionated template for building a modern R package.


Developer commands:

```bash
# build a package
R CMD INSTALL --preclean --no-multiarch --with-keep.source .

# run unit tests
R -e "devtools::test()"

# generate coverage report
R -e "covr::report(file='coverage_html/index.html')"
```
