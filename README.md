# Testing from Scratch

This is a series of exercises designed to strip away the complexity of RSpec so
that the underlying concepts can be understood. There are no libraries here,
just reasonably basic Ruby.

## Exercise 1

Run `ruby secret_diary_test.rb` and you should see this:

```ruby
; ruby secret_diary_test.rb
• PASS: that it starts off locked
• PASS: that it locks
• PASS: that it does not read the diary when locked
• PASS: that it reads diary when unlocked
```

Take some time to read through `secret_diary.rb` and `secret_diary_test.rb`.
Comment out one line at a time in `secret_diary.rb` and watch the tests fail.
Examine how mocking is done using `FakeDiary`. Take a look at `test.rb`.

## Exercise 2

TDD the following features for a new class called `Calculator`.

* The `add` method should take two arguments and return them added together
* The `multiply` method should take two arguments and return them multiplied
  together
* The `square` method should take one argument and return its square.

## Exercise 3

Extract three classes from `Calculator`:

* `Adder`
* `Multiplier`
* `Squarer`

After this, `Calculator` will just call those classes and do no other work
itself.

Ensure tests cover all classes. Use `secret_diary_test.rb` as a guide.

## After this

If you complete these exercises, you will have all the raw materials to return
to RSpec and use these simple tools: `expect(a).to eq(b)`, and creating fake
classes to use as doubles.

Your code might not be beautiful, but it will work, and you can make it cleaner
after it works.
