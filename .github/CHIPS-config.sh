#!/usr/bin/env bash
chips_number="2.5"
chips_name="hw-ruby-intro"
ci_repo_link="https://github.com/evan1997123/hw-ruby-intro-ci"
not_ci_repo_ssh="git@github.com:evan1997123/hw-ruby-intro.git"
commit_message="Automated Commit. CHIPS ${chips_number}: ${chips_name} - This repository is created by automation from \
github workflows, found at ${ci_repo_link}." 
final_folder="^./root\(/.*\)?" 
