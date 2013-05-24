# Primer

A simple ruby application for finding the nth prime.

## More?

More than anything, this is me working to improve my understanding of ruby
& testing.

Specifically built to answer
[Problem 7 from Project Euler](http://projecteuler.net/problem=7 "Problem 7 | Project Euler")

## How do I use this and its amazingness?!
- `git clone git@github.com:thewatts/primer.git`
- `cd primer`
- `bundle install` (needed for
  [progress_bar](https://github.com/paul/progress_bar))
- `ruby bin/primer` should do the trick, though I'm new at this thing.

## Things I've learned/observed thus far (as obvious as they may be)

### Methods
- Keep them small
- Only a few lines
- If there is a lot going on -> too complicated

### Modules
- Still kinda confused on this whole deal.
  - Specifically why they used modules over regular classes...
- I used the same 'layout' for organizing/creating things as [The RSPEC
  Book](http://pragprog.com/book/achbd/the-rspec-book)'s
  codebreaker project

### UX
- even though this is a terminal app, intentional readability is very
  necessary to show what's clearly going on. without such, the app could be
  confusing.

### Credits
- [@jdtornow](http://github.com/jdtornow) for helping me break down my original file `lib/primer/prime.rb` into smaller chunks & for giving me a 101 on testing!
- [@ernie](http://github.com/ernie) for giving me perspective on naming
  conventions and evaluating true use case for the project - command line app
  vs what I have now (with the messages, outputs, etc)!
- [@steveklabnik](http://github.com/steveklabnik) for sharing some code smells
  (ex: require_relative) and pointing me in the directino of some services,
  such as CodeClimate/TravisCI/Coveralls.io!
