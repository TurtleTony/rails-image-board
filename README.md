# Rails ImageBoard - RIB

## Vision
The RIB started out as a project for a uni course to learn programming Ruby on Rails.  
The goal is to provide an open source ImageBoard platform that will eventually be self-hosted.  

## Contributing
If you want to contribute to this project feel free to either contact the maintainer(s) or just submit a PR directly.

### Submitting code
When submitting code please make sure to have ssh and gpg setup properly, unsigned/unverified commits will be rejected.  
Furthermore please try to keep sane formatting.

### Branching
When working on a branch please obey the naming conventions for branches and PR's.  
A branch shall be named with the related Issue and have any further information be appended briefly in snake_case.  
```
#12
#12_part1
#12_mockup
...
```
If you do not want a branch merged try to avoid creating a Pull Request.
If you need to create a Pull Request please add a WIP (Work in Progress) label to the PR. 

You shall of course never push (or worse: force-push) onto the master branch, git will reject any attempted push immediately.

### Tagging
Version bumps (especially after go-live) shall be tagged. A commit bumping a version shall have the version number tagged.
This is mostly only relevant for multiple version bumps inside a single PR.  
If a PR changes the version the merge commit shall be tagged accordingly.

(Tagging and versioning shall be automated using CI if/when possible, which is why - for the moment - no versioning is yet in place)

## Disclaimer
Since the project was risen from a students homework a lot of cleaning up is necessary before even considering production/hosting.

## Issues
Any Feedback is welcome. Feel free to create Issues for bugs/enhancements and everything else there is a label for.  
Please do label the issues or they may be ignored or even deleted without notice.

## Milestones
Milestones shall be used for tracking progress towards a certain goal. This may include version bumps, releases, going live etc... 

##
Feel free to ask any questions by contacting maintainer(s) via their GitHub Accounts  
-- Happy Coding :)