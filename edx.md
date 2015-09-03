Adding Revised HW0 to an edX SPOC

1) Create a new unit in the HW0 by navigating the content of the SPOC to the HW0 section and clicking "+ New Unit"

![](https://www.dropbox.com/s/ue6d4cz2i0b3j85/Screenshot%202015-09-03%2018.24.14.png?dl=1)

2) Label the unit "HW0 Revised" and click the "Problem" button

![](https://www.dropbox.com/s/wtc4dt8b9kdi1q5/Screenshot%202015-09-03%2018.25.36.png?dl=1)

3) Select the advanced tab and click "Blank Advanced Problem"

![](https://www.dropbox.com/s/2e8ovai3dcx857f/Screenshot%202015-09-03%2018.26.16.png?dl=1)

4) Click 'Edit'

![](https://www.dropbox.com/s/iqhsqhlminsb5re/Screenshot%202015-09-03%2018.26.41.png?dl=1)

5) Then paste the contents of this gist:

https://gist.github.com/tansaku/dd3e9acaaec182d280fa

into the problem editor:

![](https://www.dropbox.com/s/75n8rycwyzns3yg/Screenshot%202015-09-03%2018.27.10.png?dl=1)

6) Click the settings button and adjust Display Name to 'HW0 Revised':

![](https://www.dropbox.com/s/d0ejez01l5xegsi/Screenshot%202015-09-03%2018.28.05.png?dl=1)

7) Scroll down in the settings and adjust both 'Randomization' and 'Show Answer' to 'never'

![](https://www.dropbox.com/s/1agb8xc1yedt8kr/Screenshot%202015-09-03%2018.29.03.png?dl=1)

8) Click 'Save'

The Homework is now in principle ready to publish. The 'Check' button on the homework will not become available unless the due date is set in the future, which is handled through the main content 'courseware' interface - look for the cog icon associated with the high level unit for that homework:

![](https://www.dropbox.com/s/pxutz7btw4bm5mz/Screenshot%202015-09-03%2018.31.25.png?dl=1)

Clicking that should give you the above homework settings where you can set release date, due date, and associate homework with the progress screen (using the "Grade as:" setting).

You can also hide individual units from students:

![](https://www.dropbox.com/s/pa4ojj0cw74e0kc/Screenshot%202015-09-03%2018.33.27.png?dl=1)

In order to release only the new upgraded homework, I recommend hiding the older multi-part ruby-intro units, and publishing/releasing the new HW0 Revised, which refers the student to all instructions being on the github repo (rather than in the edx units), but that's up to you.

As you can see this is all rather experimental. Armando and TAs have been working on this over the summer - I can confirm that HW0 grades correctly on the new grader, but I cannot confirm its stability - it has not yet been MOOC tested.

If you look closely at the new XML for the HW, you'll see some interesting features, specifically that you can now edit the due dates for different grade discounts, e.g. 50% after 1 week, 25% after 2 weeks, etc. and the ability to actually specify the homework uri. In principle this creates much greater configurability, although I have not yet personally tested this functionality.

Note also that the current grader queue is 'cs169-rev-development' which we currently have going to a single box. I'd like to get staging and production versions of this up to solidify the deployment process. I'll be working with Armando's TAs on that this semester; but I think the bottom line here is that these homework upgrades are experimental. We will be stress testing them as part of the MOOC, but they have not been stress tested yet, so I cannot make strong guarantees about their operation.
