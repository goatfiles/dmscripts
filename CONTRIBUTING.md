# Table of Contents

1. [Introduction](#thank-you-for-contributing-to-dmscripts)
2. [Before You Write](#before-you-write)
3. [Writing Quality Code](#writing-quality-code)
4. [Submitting Your Code](#submitting-your-code)
5. [Extra](#extra)

# Thank you for contributing to dmscripts!

We have a few rules for people who wish to make contributions to dmscripts.

These rules are established so that we can both move along with our lives faster.

# Before You Write...

You are expected to have these programs installed on the system:

+ bash - We only write bash scripts. No fish, zsh, POSIX sh or any other shells are permissible to use. We use bashisms in the scripts so any attempt to run on a bash-incompatible shell is on you.
+ dmenu - Our scripts are tailored to dmenu users first, if it doesn't work on a default dmenu installation and using the default settings we use in the dmscripts config, it shouldn't be submitted.
+ shellcheck - **WE EXPECT TESTING!** Please do not send us random, buggy and untested code. Shellcheck is a minimal Haskell program to check for errors. ```shellcheck -x your-script```

This project also expects a few other things of you:

+ Test the scripts - We cannot stress this enough, test the scripts. They should at least work on Archlinux, in X11, with bash and with a vanilla dmenu installation.
+ Write patches under free licenses - We assume all new code is under GNU GPLv3 or later and any modifications to existing code **must** be under GNU GPLv3 or later. If any script you write is NOT a GNU GPLv3 or later script, it must be explicitly said and it must be released under a license compatible with GNU GPLv3 or later. 
+ Patches must have a license - Please state the license of the patch (no license =/= free software). This only applies to new code as old code is already protected by GNU GPLv3 or later.
+ Look at other issues first - While we love new scripts, we love fixing bugs even more. If you can contribute to an existing issue that would be significantly better than adding a new script.

# Writing Quality Code

All scripts must be named in the format ```dm-[scriptname]```. Avoid naming conflicts if possible.

Please use the following boiler code to start writing from:

```bash
#!/usr/bin/env bash
#
# Script name: 
# Description: 
# Dependencies: 
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: 

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.

set -euo pipefail

_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")" && pwd)"
if [[  -f "${_path}/_dm-helper.sh" ]]; then
  # shellcheck disable=SC1090,SC1091
  source "${_path}/_dm-helper.sh"
else
  # shellcheck disable=SC1090
  echo "No helper-script found"
fi

# script will not hit this if there is no config-file to load
# shellcheck disable=SC1090
source "$(get_config)"

main() {
  # Your code here
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
```

In the testing phase of the script writing process, run the command ```shellcheck -x your-script``` and attempt to fix any errors that come up. 

Occasionally however, we want the shell script to behave in a way that shellcheck doesn't like. In that case, leave a command in this format:

```bash
# shellcheck disable=SCxxxx
# your code here
```

In the output you should recieve an error code which matches the SCxxxx format. The x's would be numbers.

In the script writing process we expect consistent indentation. Preferably, use TWO spaces instead of tabs.

Finally we expect you to update the existing documentation if you can do that. This includes: README.md, man.org and the code itself. **Scripts are sorted in alphabetical order**

# Submitting Your Code

Write clean commit messages explaining what you have done in one sentence.

(Notes: -a automatically updates any modified files, use git add to add new files) 

```bash
$ git commit -am "your message here"
```

Patches should ideally try to focus on one goal if possible. This is to avoid conflicts.

After commiting push and then make a merge request explaining why your patch should be merged into upsteam. 

(Notes: advanced use cases may require seperate flags)

```bash
$ git push 
```

Here is where you put all of the details. Explain what has been changed and why it has been changed.

# Extra

With that you are done. Your changes will either be accepted or rejected. We thank you for your contribution and we hope to see you again sometime.

If you would like to regularly contribute, look into [repository mirroring](https://docs.gitlab.com/ee/user/project/repository/repository_mirroring.html).
