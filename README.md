# RScaffold

An opinionated template for building a modern R package.


Developer commands:

```bash
# document, build, and test
R -e "devtools::document()"
R -e "devtools::build()"
R -e "devtools::install()"
R -e "devtools::test()"

# generate coverage report
R -e "covr::report(file='coverage_html/index.html')"
```
