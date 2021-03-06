# Contributing

Thank you for your interest in contributing! We welcome developers of all skill levels to contribute to Passr and will provide issues for those new to open-source and veterans alike. All tasks that we are looking to complete can be found in the [Issues](https://github.com/rdavid1099/passr/issues) section. If you find a bug or would like to implement new functionality, please feel free to contact the owner, [rdavid1099@gmail.com](mailto:rdavid1099@gmail.com).

## Installation

- Fork and clone Passr to your local machine, use [this guide](https://help.github.com/articles/fork-a-repo/) if you don't know how to do that.
- Set the upstream remote so you can keep your copy of Passr synced with the original. To do that go to your terminal and `cd` into your cloned Passr directory. Then user one of the following commands:

   If you have ssh set up with Git
   ```
   $ git remote add upstream git@github.com:rdavid1099/passr.git
   ```
   Otherwise
   ```
   $ git remote add upstream https://github.com/rdavid1099/passr.git
   ```

- From the root directory run `bundle install` to install all gem dependencies.
- Run `rake` to run all tests.

## Code Style

While we encourage creativity and "clever" code, your implementation must follow basic Ruby standards and practices. This includes:

- Write readable and succinct code, and use standard functions in Ruby to the best of your knowledge.
- Blank lines should contain no spaces, and there should be no additional white space following the end of a line of code.
- Follow the [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) principle.
- Have fun!

## Testing

Tests are imperative to creating a functional and success program. We follow test driven development, and writing test cases should be done before any lines of code are written. Our test suite uses [Minitest](http://ruby-doc.org/stdlib-2.0.0/libdoc/minitest/rdoc/MiniTest.html) and should follow basic Minitest formatting and style. All features/ bugs must include coinciding tests to confirm their functionality, including sad cases.

### Writing Tests

Before creating a new test method or file, be sure to review `./test/test_helper.rb`. A lot of base logic is located in that file.

### Running Tests

Run `rake test` to run all tests in test suite.

## Documentation

If adding new functionality, be sure to keep the documentation up-to-date. We use [YARD](http://yardoc.org/) for documentation. Be sure to follow the style present throughout the codebase and refer to docs for any additional questions. For functions, write a description, parameters (if any), and the return value (if non-void).

To view the most recent documentation run `yardoc` from the root directory and then run `yard server`. In your favorite browser, go to `localhost:8808`. You can also check out our [online documentation](http://www.rubydoc.info/github/rdavid1099/passr/master).

## Pull Requests

All branches should be based off the `development` branch and written using the following format, `ISSUE_NUMBER-SUMMARY-OF-ISSUE` (ex: `12-create-contributing`). Before submitting a pull request, run `rake test:all` in the top-level directory to verify that all tests are passing. Make your pull request to `development` unless stated otherwise in the issue tracker. We will check for new pull requests at the end of every day and review/ comment on them as necessary.
