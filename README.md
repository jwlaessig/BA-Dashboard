# Learning Application for linear Regression

Jürgen Willy Lässig <jwlaessig@gmail.com>, March 2024

## Basic information

This learning application uses the package [learnrextra](https://github.com/IFAFMultiLA/learnrextra).

## Installation

- First, the package [renv](https://rstudio.github.io/renv/index.html) must be installed.
- It may be necessary to install the system package `libglpk-dev` in your OS.
- Then, all package dependencies can be installed using `renv::restore()`.

## "learnrextra" package

- This learning application depends on a self-developed extension to learnr called *learnrextra*.
- The development version of learnrextra is located in a [public GitHub repository](https://github.com/IFAFMultiLA/learnrextra).
- If the development version of learnrextra is updated, i.e., a new commit is loaded into the main branch of the repository, this new version can be installed using `devtools::install_github('IFAFMultiLA/learnrextra')` (alternatively, `devtools::install_local(<path-to-local-project>)` can be used).
