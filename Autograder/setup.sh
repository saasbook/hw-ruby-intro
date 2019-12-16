#!/bin/bash

# this file should run all the commands needed to setup the autograder
# In our case, this means ensure Ruby and Rubygems are installed and run `bundle`
# It's possible we may use a different Gemfile etc for Gradescope than for legacy grader

apt-get install -y ruby-full
gem install bundler
gem install rspec
