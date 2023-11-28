going over the gitflow not too crazy just what i ant to know

shout out to this video for the help https://www.youtube.com/watch?v=zr7MpE_Eb6A

the branches:

create the branches
git checkout -b 

- prod - live running code
  - hotfix -- fixing things on production
- staging (blue/green deployment)
- main/develop 
   - feature branches (which will be the different features being worked on) - feature branches get merges to main
        create branch:
      - git checkout -b feature/thefeature-im-working-on
        send to remote to make a pull request
      - git push or git push --set-upstream origin feature/thefeature-im-working-on (the branch im working on)
- qa -- quality assurance testing if your org has that

