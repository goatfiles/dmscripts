# Table of Contents

1. [Introduction](#thank-you-for-submitting-a-bug-report)
2. [Before Reporting](#before-reporting)
3. [Useful Information](#useful-information)
4. [End Result](#end-result)

# Thank you for submitting a bug report!

We take bug reports, support requests and Gitlab issues very seriously and we hope you choose to report bugs to us when they are found.

While we do not have a template and we will not shoo you away if you make a mistake in your reporting, we have a general list of recommendations to ensure that your issue is fixed as soon as possible.

# Before Reporting...

Please ensure you are on the latest build from gitlab before reporting any issues. It's entirely possible that your version is now outdated and your problem has been resolved. You can use *git pull* to update to the latest version. If you maintain a fork please look into [repository mirroring](https://docs.gitlab.com/ee/user/project/repository/repository_mirroring.html) to get the latest updates.

Verify that the bug is reproduced on an unmodified build, if possible. Occasionally, someone may patch their project or their configuration and as a result, they create a bug that doesn't exist upstream. We would encourage you to attempt to fix any bugs that aren't upstream and please inform us if the bug is on a modified version and hasn't been reproduced in upstream.

By default, we expect dmscripts to be run with bash, standard GNU coreutils, an unmodified version of dmenu and on a Linux distribution. Please explicity state if any of these assumptions do not apply to you so we can assist you better.

If you know any amount of shell script, we encourage you to take a look at fixing the issue yourself and then submitting it in a merge request. Shell is pretty easy to learn, it usually says in plain English what is wrong and we are busy dealing with bug reports and with our own ambitions. We cannot stress how greatful we are if you fix the problem on your own and we absolutely encourage it.

If you would like to request a feature, this guide is not tailered to that however you can carry on as most of this is still applicable somewhat.

# Useful Information

While we would love to be able to read everyone's minds, we unfortunately are limited in our powers so we need some information to help. As a general rule, the more the marrier however not all of this information is needed for a good bug report.

Useful information includes:

+ Brief description of the bug - The title should be a brief but useful explanation about what the bug is.

Lets say we have this error in dm-foobar "./dm-foobar: line 53: dm-foobar fails to launch barfoo: unrecognized variable fobar"

How do we summarize this elegantly?

Good example: "dm-foobar fails to launch barfoo module" - it tells us in a non-technical way what we need to know. We know now that there is a problem with dm-bookman and it involves bookmarks

Bad example: "dm-bookman is broken" - Too little information. How is it broken? Why is it broken? We can't even speculate unless we've been working on that file.

Bad example: "dm-bookman gives me an error on line 53..." - This is the opposite problem. We are overwhelmed with information and depending on how it's worded it can be very difficult to find the problem.

+ Name of distro - Try to name your distro or even better your parent distro. This can help us conclude if it's a distro problem or a script problem.
+ Has your script been modified? - We need to know as it becomes harder to tell if your script has been modified or not.
+ Give us your configuration - If your config has been modified, please give us the entire config. 

You can figure that out by running the following:

```bash
$ diff -u "path/to/config" "/etc/dmscripts/config"
```

or by manually comparing on the gitlab.

+ Version of dmscripts - Tell us what version you are on so we know to fix it.

Using git, provide the latest commit:

```bash
$ git rev-parse --short HEAD
```

Using AUR or DTOS repos, you can provide us an approximate value by running the following on your config:

```bash
$ tails -n1 path/to/config
```

Copy the entire line and send it in your report.

+ Steps to reproduce the bug

This could be as simple as "run the program" or as complex as running the program and diving deep into a submenu of the application. Be descriptive when applicable. 

+ Copy any error messages 

This is where you would copy the error message from earlier.

+ Any other information that may be useful

Again this could be just nothing or it could be something complex like versions of dependencies or other configs such as the bashrc, it depends on a case by case basis and most likely we will ask follow up questions if we need to.

# End Result

In the end, the issue should look a bit like this:

```
# dm-foobar fails to launch barfoo module

Distro: Archlinux
Modified: No
Config: Unchanged
Version: _revision=21
Steps to reproduce:

1. run dm-foobar
2. select barfoo

Error messages: 

"./dm-foobar: line 53: dm-foobar fails to launch barfoo: unrecognized variable fobar"

Other info: Not applicable.
```

Obviously, tailor this to your needs as this is just a basic example. Real issues are often more complex and may not even have an error message. If there is no error message simply try to describe what happens and why you think this behaviour is a bug.

With that you are done. We again thank you for sending an issue and we hope to see you again sometime.
