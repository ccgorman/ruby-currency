# FreeAgent Coding Challenge

## Your Solution Setup and Run Instructions

1. Installed Ruby with rbenv
2. Installed version 2.5.3
3. Switched Mac to use this version, $ rbenv local 2.5.3 - this was actually a blocker for a while to get RubyGems installed until I noticed my Mac was using an old version and figured out how to switch to the new version
4. Set up a git repo so I could track my changes and roll back if required
5. The steps specified in the instructions can be run to test the solution

## Your Design Decisions
1. I decided to put validation on user input, if a new source rate feed is added then the access to it ideally should be the same way, alternatively validation could be put on each source rate feed, if the feed is managed with a class.
2. Tests were put in place to check user input
3. I was thinking a long term solution would be to have a seperate class for the feed that fetched and formatted it, for the moment I just put a reference to the feed as a constant, so that constant could change, easily found at the top of the file.
4. Being more of a PHP programmer for the feed I would have perhaps made an abstract class and implemented methods for this feed, like fetch and format, perhaps include get rates by date or even validation checks, but time to learn similar methods in Ruby was against me.
5. Perhaps with exceptions it would be better to rescue them and print out a friendly error, but I followed the instructions and raised an exception.
6. Tests mainly focused on testing exceptions and also exchanges returned the correct value.