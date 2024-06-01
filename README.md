# Parse Git Status
Extract and sumarizes the most relevant git status information for your terminal command prompt

# Testing
Run the script inside a git folder and check printing:
```bash
bash parse_git_status.sh
```

# Using
Include the function `parse_git()` on your `.bashrc` file before `PS1` is set. The append a call to your customized `PS1` variable:
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(parse_git)\n\$ '
```