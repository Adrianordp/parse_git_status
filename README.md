# Git Status Parser

This script extracts and summarizes essential Git status information for your terminal command prompt.

## Testing
To test the script, navigate to a Git repository and execute the following command in your terminal:
```bash
bash parse_git_status.sh
```
Ensure that the script is properly displaying the relevant Git status information.

## Usage
1. Add the function `parse_git()` to your `.bashrc` file. Ensure it is placed before the setting of the `PS1` variable.

2. Then, append a call to your customized `PS1` variable including the Git status information. Below is an example `PS1` variable including the Git status:
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(parse_git)\n\$ '
```
This will display the username, hostname, current directory, and Git status information in your terminal command prompt.

# Understanding Color Scheme and Captured Statuses

## Color Scheme
The script utilizes ANSI escape sequences to apply colors to different elements of the Git status information. Here's a breakdown of the color scheme used:

- **CYAN**: Represents information related to commits ahead of the remote repository.
- **GREEN**: Indicates staged changes in the working directory.
- **ORANGE**: Highlights unstaged changes in the working directory.
- **RED**: Marks untracked files in the working directory.
- **YELLOW**: Used for enclosing parentheses and as a base color for branch names and some symbols.
- **RESET**: Resets the color to the default for the terminal.

## Captured Statuses
The script parses various aspects of the Git repository's status and represents them with specific symbols and colors:

1. **Branch Name**: The name of the current branch is displayed in yellow.
2. **Untracked Files**: If there are untracked files in the working directory, a red "u" is appended to the branch name.
3. **Commits Ahead**: If there are commits ahead of the remote repository, a cyan "a" followed by the number of commits ahead is displayed.
4. **Staged Changes**: A green plus sign "+" is shown if there are staged changes in the working directory.
5. **Unstaged Changes**: An orange plus sign "+" is displayed if there are unstaged changes in the working directory.

By incorporating these color-coded indicators into your command prompt, you can quickly assess the state of your Git repository without having to run additional commands or checks. This enhances efficiency and helps in tracking changes while working within the Git environment.