## Setup
* Ruby installed. Version > 2
* `bundler` gem installed. To install: `gem install bundler`
* In the project root run `bundle install`

## To run unit tests
`bundle exec rspec`

## To execute the script
`bundle exec ruby pyramid.rb 1 2 3 1`

## Comments:
- If you pass a string as an argument, Ruby will convert it to zeros

## PART 2:
Using provided requirements, such as how the pyramid is built and how the arguments are provided, I built an application that constructs a pyramid based on the initial arguments that user passes via command-line.

I verified that my program met the acceptance criteria based on the results it outputs when its fed the arguments provided in the two given examples. I created and ran automated unit tests that use the data from given examples - 1 2 3 1 and 4 5 2 3 1.

To ensure the quality of my product, I created and executed the following test cases manually:

- app should build a pyramid using provided positive integers (pass 1 2 3 1 and 4 5 2 3 1)
- app should build a pyramid using provided negative integers (pass -1 3 2 0 -3)
- app should convert strings to zeros (pass a b - d)
- app should return passed integer if its the only arg as a base (pass 1)
- app should be able to build a pyramid with base consisting of large data (pass 10,000 elements)
- app should raise error is no arguments are passed (pass no args)
 
