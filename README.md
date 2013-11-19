cs190lab6
=========

Before starting this lab, we again urge you to check over the git reference sheet [Git Reference](./git_reference.md)

And the slides can be found here [Git week 2](https://docs.google.com/a/scottopell.com/presentation/d/1zmM8ySifYmx3arxsvLsEK9eUrGzWNsZdq1qGN8esA5E/)

Last weeks lab can be found [here](http://github.com/scottopell/cs190lab5) if you need to reference it for anything.

This is another partner lab, so buddy up!

## What You'll Learn
By the end of this lab, you'll be able to creat, use, merge and delete (local) branches.

## Setup ##

Depending on your working environment, perform the appropriate action:

| Environment   | Action        |
| ------------- | ------------- |
| Linux Lab Machine            | Open a terminal window        |
| Windows or Personal Computer | SSH into `data.cs.purdue.edu`*  |

----

\* You must have X11 forwarding enabled. If you are on the Windows Lab Computer, follow the instructions below:

1. Search for 'Xming' in the start menu and run it.
2. Open PuTTy
3. Expand the 'SSH' tab from the 'Category' list
4. Choose 'X11' from 'SSH' list
5. Check 'Enable X11 Forwarding'
6. Connect like normal to `data.cs.purdue.edu` within PuTTy.

### Git Setup

You should have your git username and email set up from last week, if you get any messages about missing them, refer to last weeks lab.


   ```bash
   git config --global push.default simple
   ```
   
### Setting up your repository. 
#### Do WITH your partner on ONE computer

1. Make a directory for this lab. wget all the files into it. TODO
