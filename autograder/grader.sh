#!/usr/bin/env bash

cd .guides/secure/

bundle exec rspec -I /home/codio/workspace/assignment/lib/ -r ruby_intro.rb autograder/part$1_spec.rb --format j | python ~/workspace/.guides/secure/saas_grade.py
