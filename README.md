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
PR's shall be named like the branch.  
If you do not want a branch merged try to avoid creating a Pull Request.
If you need to create a Pull Request please prepend a [WIP (Work in Progress) label](https://github.com/marketplace/wip)
to the PR name.  
Furthermore please delete branches after merging to prevent lingering zombie branches.

You shall of course never push (or worse: force-push) onto the master branch, git will reject any attempted push immediately.

### Tagging
Version bumps (especially after go-live) shall be tagged. A commit bumping a version shall have the version number tagged.
This is mostly only relevant for multiple version bumps inside a single PR.  
If a PR changes the version the merge commit shall be tagged accordingly.

(Tagging and versioning shall be automated using CI if/when possible, which is why - for the moment - no versioning is yet in place)

### Gitignore / Gitkeep

If any folder/directory structure shall be persisted to git without committing any files (e.g. storage folder) a `.keep` file
shall be placed in that directory. If a branch of multiple folders/directories shall be persisted please only add the `.keep`
file to the deepest possible parent directory

If any folder/file shall not be persisted to git please add a `.gitignore` file to the parent directory so that every
gitignore may only influence the folder it is located in. Auto-generated `.gitignore` files (e.g. the the rails one)
shall be an exception to this rule.

### Commit Messages
Commit message MUST follow [The seven rules of a great Git commit message](https://chris.beams.io/posts/git-commit/)

    1. Separate subject from body with a blank line
    2. Limit the subject line to 50 characters
    3. Capitalize the subject line
    4. Do not end the subject line with a period
    5. Use the imperative mood in the subject line
    6. Wrap the body at 72 characters
    7. Use the body to explain what and why vs. how
    
If your commit messages do not follow these rules (you MAY do exceptions on line length) your PR will not be approved.

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