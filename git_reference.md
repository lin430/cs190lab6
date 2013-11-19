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

### Most of the Important Commands

Download an existing repository

```bash
git clone <url here> <location here>

# ex.
git clone https://github.com/scottopell/cs190lab5.git ~/cs190lab5
```

---
Push commits to a remote branch

```bash
git push
```

---

Pull latest commits from remote branch

```bash
git pull
```

---
Check status of repository

```bash
git status
```

---
Check log of recent commits

```bash
git log

# OR, for a simpler view
git log pretty=oneline
```

---
To remove a file from the staging area

> This will unstage the given file, meaning when you do `git commit`, the changes to this file will NOT be included

> You will only ever need to do this if you accidentally `add` a file

```bash
git rm --cached <filename>
```

---
Commit latest changes with a short message

```bash
git commit -m "<message here>"

# ex. 
git commit -m "initial commit"
```

---
Add all files in current directory

```bash
git add .
```

---
Add changes to _tracked_ files to the staging area AND commit them

```bash
git commit -am "<message here>"

# ex.
git commit -am "fixes bug #4"
```

### Troubleshooting

If something goes wrong, use `git status` and `git log` to see if you can figure out what happened.
Remember, don't panic, as long as you committed something, its virtually impossible to lose it

For branching issues, try `git log --graph --full-history --pretty=format:"%h%x09%d%x20%s"`

Since we should all have color set up we can try `git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"` for an even prettier view
