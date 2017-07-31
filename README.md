Ruby Intro CI
=============

[![Build Status](https://magnum.travis-ci.com/saasbook/hw-ruby-intro-ci.svg?token=CPXPCn5Dy1cwCKsavtqL)](https://magnum.travis-ci.com/saasbook/hw-ruby-intro-ci)

Please find instructions for the homework itself at: https://github.com/saasbook/hw-ruby-intro/blob/master/README.md

This is a separate (private) repo that contains the solutions and walkthrough, as well as tests of various aspects of the assignment.

### Current Test running

One can make a superficial check that the current specs grade reference solutions correctly by running:

```sh
$ ./check.sh
```

### Legacy Test Running

The following approach is what used to work for an old version of the grader that allowed us to grade assignsments from the command line.  However that functionality was removed following the refactoring to use the XQueue gem ...

In order to run the tests first run the following to install the latest production version of the grader:

```sh
$ bundle exec cucumber install/
```

Note the above command might take a long time to install since it will be installing all the gems for the grader itself.

Assuming that installs the grader successfully you can then run the cucumber tests of the assignment itself against the production grader like so:

```sh
$ bundle exec cucumber
```

