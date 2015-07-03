Travis CI Badge
[![Build Status](https://magnum.travis-ci.com/saasbook/hw-ruby-intro-ci.svg?token=CPXPCn5Dy1cwCKsavtqL)](https://magnum.travis-ci.com/saasbook/hw-ruby-intro-ci)


Ruby Intro CI
=============
Checking the integrity of the Ruby Intro Assignment

Notes
----

This repo exists as a result of a process of splitting all the 169 homeworks into separate repos, e.g.

https://github.com/saasbook/ruby-intro

that are each paired with a private CI repo that would check their integrity, e.g. this one:

https://github.com/saasbook/ruby-intro-ci

The entire set up might be easier if everything with public.  The argument for the privacy is that if students have access to the tests that check their solutions they will be able to somehow 'cheat' although the counter-argument is that none of the 169 homework tests really reveal how to create a solution given that they are usually high level behavioural tests. Anyhow, the customer requirement was that some tests were to be kept private, so the *-ci repos are private.  And the workflow is this.

Anytime that one wants to make a change to the student visible homework (e.g. to https://github.com/saasbook/ruby-intro), or the way in which they are graded (e.g. to https://github.com/saasbook/ruby-intro-ci) they submit  a pull request to the relevant repo.  Pull requests to the public student repo don't really have any effect - they just need to be reviewed and sanity checked by an admin - because the two repos are separate and the tests are in a private repo it's not obvious how to have pull request to publie repos kick off the tests.

You might we should just have one repo, but then that would have to be private, and there would be no starting repo for students to fork and then submit pull requests if they find issues.  Enabling students to submit pull requests on the public repos is absolutely critical for QA.  1000's of students try the early homeworks, finding all sorts of corner cases that we need to fix.  It's sooooo much more manageable to handle as pull requests rather than emails or forum posts.

So any admin wanting to approve a pull request on a public repo needs to kick off a run of the Travis CI on the private repo to make sure that the proposed changes don't break the grader or are incompatible with the private tests etc.

Given that an instructor is proposing changes to the private repo, i.e. the private tests, then Travis will automatically kick off a check on any pull request.  The way things are set up there is a two stage process:

1. Travis pulls out the autograder (without edx component)
2. Travis runs the autograder on code from both the private and public repos in order to check consistency

Both these stages are coded in cucumber, e.g.

https://github.com/saasbook/ruby-intro-ci/blob/master/install/install.feature
https://github.com/saasbook/ruby-intro-ci/blob/master/features/skeleton_and_solution_check.feature

The whole process is designed to try and prevent errors from creeping in from any changes to the skeletons and public tests that the students clone, the private tests that are used to check the solutions, the example solutions, and even the autograder itself.

This was all fairly simple for the first few homeworks, however as one gets up to the more complex rails homeworks there was a fair deal of complexity and hard work to make everything flow.  If memory serves everything is working on all hws due to particularly herculean efforts on the part of Paul, but I think the process left all of us rather tired of the whole autograder setup, which seems much more complex than in needs to be.  Paul did a great job, but the complexity of the whole thing meant that it was very difficult to onboard other volunteers, so Paul often ended up working alone with just a little outside support.   If only we could have got two or three other committed volunteers involved it might have been a different story.

Anyhow, the framework is largely there, and working - please do check out the relevant repos and you can run the cucumber tests locally to do the same thing that Travis does.

Most complexity will usually come from the autograder install.  Unfortunately the autograder codebase is extremely convoluted and in a rather poor state.  The intention of all this Travis C.I. work with all the different repos was to get us to the point that we could start safely refactoring the autograder itself knowing that we weren't breaking all the homeworks, however we never really got to the that point - we set up the overarching CI with a lot of effort, but by that time we were all pretty much burnt out.

So the options moving forward are to try and refactor the existing autograder, which should be able to be done with some reliability now (although still the checks against all homeworks make the debug cycle a bit long); or to effectively bin the existing autograder as beyond hope and replace it with something leaner, that's actually programmed according to agile principles, i.e. test driven and not just hacked together to basically work given a few manual tests.

Best of luck!