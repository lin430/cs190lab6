Git Reference Sheet
=====

This is a reference guide for the git commands that we've gone over in lecture and that you will need for the lab.

### Setting Up a New Repo

1. Create a repository in the current folder

  ```bash
  git init
  ```
  --- 

2. Tell git to track a new file

  ```bash
  git add <filename(s)>
  ```
  --- 
  
3. Commit changes in staging area

  ```bash
  git commit -m "<message here>"
  
  # ex.
  git commit -m "adds initial java files for lab 8"
  ```
  ---
 
4. Add remote repository 
  
  ```bash
  git remote add origin <Github_repo_url> 

  # ex.
  git remote add origin https://github.com/tyhoff/asdf.git
  ```
  ---

5. Initial push of commits to remote branch

  ```bash
  git push -u origin master
  ```

### Pushing Changes to Previously Configured Remote 

1. Add changes made to some file to the staging area
  
  ```bash
  git add <filename(s)>
  ```
  ---

2. Commit changes to staging area
    
  ```bash
  git commit -m "<message here>"
  ```
  ---

3. Push changes to remote repository
    
  ```bash
  git push
  ```

### Creating and Merging a Branch

1. Create a branch
  
  ```bash
  git branch <branch name>
  
  # ex.
  git branch multiplayer-feature
  ```
  ---

2. Checkout(Switch to) a branch

  ```bash
  git checkout <branch name>
  
  # ex.
  git checkout multiplayer-feature
  ```
  ---
  
3. Add changes and commit to a branch (same as regular)

  ```bash
  git add <filename(s)>
  git commit -m "<message here>"
  
  # ex.
  git add game.rb
  git commit -m "Made changes to the gameplay handler"
  ```
  ---
  
4. Merge a branch

  ```bash
  git checkout <merge destination branch>
  git merge <merging branch>
  
  # ex.
  git checkout master
  git merge multiplayer-feature
  ```

### Troubleshooting

If something goes wrong, use `git status` and `git log` to see if you can figure out what happened.
Remember, don't panic, as long as you committed something, its virtually impossible to lose it

For branching issues, try `git log --graph --full-history --pretty=format:"%h%x09%d%x20%s"`

Since we should all have color set up we can try `git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"` for an even prettier view
