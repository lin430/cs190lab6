cs190lab6
=========

Before starting this lab, we again urge you to check over the git reference sheet [Git Reference](./git_reference.md)

And the slides can be found here [Git week 2](https://docs.google.com/a/scottopell.com/presentation/d/1zmM8ySifYmx3arxsvLsEK9eUrGzWNsZdq1qGN8esA5E/)

Last weeks lab can be found [here](http://github.com/scottopell/cs190lab5) if you need to reference it for anything.

This is another partner lab, so buddy up!

## What You'll Learn
By the end of this lab, you'll be able to create, use, and merge branches.

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

The command below will set your `git push` action to an appropriate default. 

```bash
git config --global push.default simple
```

This command sets your default editor (just for today's lab) to be gedit for merge messages.

```bash
export EDITOR="gedit"
```
> This only lasts as long as the terminal window you ran it within. As soon as you close the window, this setting is lost.
 
### Setting up your repository. 
#### Do WITH your partner on ONE computer

1. Create a new repository on github and add your partner as a collaborator  **Don't skip this**
2. Make and go into a directory in your home directory for this lab. The path should look something like `~/cs190lab6`

  > Use `mkdir` and `cd` for this

3. Download `text_mutator.rb` into this directory.

  ```bash
  wget https://github.com/scottopell/cs190lab6/raw/master/text_mutator.rb
  ```
 
4. Initialize a repo, add, commit, and push this file.

  ```bash
  git init
  git add text_mutator.rb 
  git commit -m 'adds text_mutator.rb'
  git remote add origin <github_url>
  git push -u origin master
  ```
 
5. Have your partner clone this repository onto their machine.

  ```bash
  git clone <url_from_partner>
  ```

6. The partner that just cloned this repository will also need to `cd` into the repository that the `clone` just created.

  ```bash
  cd <repository_name>
  ```

7. Decide which one of you wants to debug, and which wants to add a new feature. Proceed to either "Bug Fixes" or "New Features" depending on which one you're doing. DO NOT DO BOTH, EACH PARTNER DOES ONE!!

### Bug Fixes

1. Lets make our own branch,since we don't know how many commits or how long this will be.

  ```bash
  git branch bug-fixes
  git checkout bug-fixes
  ```

2. So, you have your repository with a fresh version of `text_mutator.rb` If you run it, like so

  ```bash
  ruby text_mutator.rb --reverse Hello World
  ```

  You'll notice that you get an output that's reversed, but it only reverses the first word. This isn't very much fun. Lets fix it.

1. Open up `text_mutator.rb` in your editor of choice and look through the code.
2. You can see that to get the input text (from line 12)

  ```ruby
  text = ARGV[1]
  ```
   > This code just gets the second argument after `text_mutator.rb`, which in our case is 'Hello'.
   
3. Instead of that, lets prompt the user for input.

  > Since you guys (probably) don't know ruby, we'll give you most of the code

4. So instead of getting the data from text from the command line arguments, we can use `$stdin.gets.chomp` to prompt for input

  > `stdin` refers to the user input from the terminal
  > `gets` stands for `get string`
  > `chomp` gets rid of the trailing newline (don't worry about this for now)

5. Line 12 should now be

  ```ruby
  text = $stdin.gets.chomp
  ```

6. We should probably tell the user whats happening, so add a line ABOVE the line above that says

  ```ruby
  puts "Input some text, please"
  ```
  > This means that the line with `puts` should come before the line with `gets`.


7. Now save this, exit, and run the program again.

  ```bash
  ruby text_mutator.rb --reverse
  ```

8. Now we should be prompted for input, so type in some text and it should output it as expected!
9. Let's `add` our changes to git

  ```bash
  git add text_mutator.rb
  ```
 
10. `commit` these changes

  ```bash
  git commit -m 'fixes bug with text input, changes source from argv to user input'
  ```
 
11. Now lets push our changes to the remote 

  ```bash
  git push -u origin bug-fixes
  ```
 
  > Note, its our first push on this branch, so we want to use `-u`, and we're pushing to the remote named `origin` and our branch is named `bug-fixes` 

12. Log onto github and look at our new branch!

  ![Branch](http://i.imgur.com/pxjHgWo.png)
  
  > To view different branches, click on the button surrounded in red above.

13. We like our changes, so lets merge them back into master

  ```bash
  git checkout master
  git merge bug-fixes
  ```

14. And lets push our changes up to the remote. NOTE: You may get an error here, you simply need to `pull` your partner's latest changes

  You may also get a popup in gedit here, simply save and quit gedit.

  ```bash
  git push
  ```
 
15. Now lets wait for our partner to finish up and continue on to "Wrap-up"

### New Features

While your partner is fixing bugs, we're going to add some new features to this program!

1. Lets make our own branch,since we don't know how many commits or how long this will be.

  ```bash
  git branch new-features
  git checkout new-features
  ```


2. Run the program wiith no arguments, like this, like this

  ```bash
  ruby text_mutator.rb
  ```

  We'll see a message showing us how to use the program.

  ```
  Usage: ruby text_mutator.rb [--reverse --upper --lower] <input text>
  ```

3. So lets run it with the following input

  ```bash
  ruby text_mutator.rb --upper scott
  ```

  And we'll see our output
  
  ```bash
  SCOTT
  ```

  We want to add an option to to invert the case of the string, so our goal is to be able to do the following
  
  ```bash
  # THIS WILL NOT WORK YET
  # we need to follow the steps below before this will work
  ruby text_mutator.rb --swapcase heLlO
  ```
  
  output
  
  ```
  HElLo
  ```

4. The easiest change to make is to add `--swapcase` to the `usage` string. Change line 4 to match the following

   ```ruby
  puts "Usage: ruby text_mutator.rb [--reverse --upper --lower --swapcase] <input text>"
   ```
 
**The next change we'll make is in the case statement**

1. Add these lines under line 21, in the same format as the lines above, to add support for the `--swapcase` flag

  ```ruby
  when "--swapcase"
    mod_text = swapcase_mod text
  ```

2. Now that we've added a call to the method `swapcase_mod`, we need to create that method. We can do this by inserting these lines under line 46.

  ```ruby
  def swapcase_mod input
    input.swapcase
  end
  ```

3. That's it! Now we can save this, exit, and try running it with our new method like this.

  ```bash
  ruby text_mutator.rb --swapcase hElLo
  ```

  And hopefully we'll see this output

  ```
  HeLlo
  ```

  **Now everything is working, and we like our changes, so lets commit them.**

4. Let's `add` our changes to git

  ```bash
  git add text_mutator.rb
  ```
 
5. `commit` these changes

  ```bash
  git commit -m 'add swapcase option'
  ```
 
6. Now lets push our changes to the remote 

  ```bash
  git push -u origin new-features
  ```
 
  > Note, its our first push on this branch, so we want to use `-u`, and we're pushing to the remote named `origin` and our branch is named `bug-fixes` 

7. Log onto github and look at our new branch!

  ![Branch](http://i.imgur.com/pxjHgWo.png)
  
  > To view different branches, click on the button surrounded in red above.

8. And we like our changes, so lets merge them back into master

  ```bash
  git checkout master
  git merge new-features
  ```

  > Note: you might get a merge message here (it will open in gedit), if you do, simply save the file and quit
  > If you get a strange message about something not being successfull, call over a TA

9. And lets push our changes up to the remote. NOTE: You may get an error here, you simply need to `pull` your partner's latest changes

  You may also get a popup in gedit here, simply save and quit gedit.

  ```bash
  git push
  ```

Now just wait for your partner to finish up theres and then continue on to "Wrap-up"

### Wrap-up

So now, if we both pull down the latest version of master, we can see that the changes made in both branches are there, and we can input from a user prompt, and we can use the swapcase function, all without any merge conflicts!

For grading, open up your repository on github, and navigate to the network tab on the right (same as last week)

Ask the TA about anything you might be unclear on
