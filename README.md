# Code Challenge

## Installation

```shell
$ bundle install
```

## Running tests

```shell
$ bundle exec rspec
```

## Execution

```shell
$ awk '{print $0}' data/* | ruby convert.rb
```

## Commentary

I've represented entries and gender with specialized objects, and birth dates with Ruby `Date` objects. A `Decorator` handles string representation of those attributes, and a `Reporter` presents in the final format.

In terms of instantiating the domain objects from the incoming strings, `Gender` is responsible for its own interpretation, whereas `Entry` is resposible for interpreting birth dates. I could have added a `BirthDate` type for that logic, but it seemed overkill in this case.
