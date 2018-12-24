# FreeAgent Coding Challenge

Thank you for your interest in the FreeAgent Coding Challenge.  This template is a barebones guide to get you started.  Please add any gems, folders, files, etc. you see fit in order to produce a solution you're proud of.

## Coding Challenge Instructions

Please see the INSTRUCTIONS.md file for more information.

## Your Solution Setup and Run Instructions

1. Installed Ruby with rbenv
2. Installed version 2.5.3
3. Switched Mac to use this version $ rbenv local 2.5.3 - this was actually a blocker for a while to get RubyGems installed until I noticed my Mac was using an old version and figured out how to switch to the new version
4. Set up a git repo so I could track my changes and roll back if required
5. The steps specified in the instruction can be run to test the method

## Your Design Decisions
1. I decided to put validation on user input, if a new source rate feed is added then the access to it ideally should be the same way, alternatively validation could be put on each source rate feed class.
2. I was thinking a long term solution would be to have a seperate class for the feed that fetched and formatted it, for the moment I just put it as a constant, so that constant could could change, but an expectation is the format would be the same.
3. Being more of a PHP programmer for the feed I would have perhaps made an abstract class and implemented methods for this feed, like fetch and format, perhaps include get rates by date or even validation checks, but time to learn similar methods in Ruby was against me
4. Perhaps with exceptions it would be better to rescue them and print out a friendly error, but I followed the instructions and raised an exception
