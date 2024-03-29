# Named Proc [<img src="https://badge.fury.io/rb/named_proc.svg" />](https://badge.fury.io/rb/named_proc) [<img src="https://github.com/janlelis/named_proc/workflows/Test/badge.svg" />](https://github.com/janlelis/named_proc/actions?query=workflow%3ATest)

When working with a lot of procs, naming them might become handy. It makes identifying them later easier. For an example that uses named procs, see the [multi_block](https://github.com/janlelis/multi_block) gem!

Currently supports CRuby only.

## Setup

Add to Gemfile:

    gem 'named_proc'


## Named Procs

A named proc acts like a normal proc, but it has a name attribute. You create it by calling a method with the desired name on `proc`:

    >> a = proc.even?{ |e| e.even? }
    => #<NamedProc:0x00000001ffc340@(irb):1>
    >> a.name
    => :even?
    >> a[42]
    => false

In the same way, you can create lambdas:

    >> b = lambda.doubler{ |e| e * 2 }
    => #<NamedProc:0x000000020685e0@(irb):7 (lambda)>
    >> b.name
    => :doubler
    >> b[21]
    => 42
    >> b.lambda?
    => true

## MIT License

The original gist: https://gist.github.com/4b2f5fd0b45118e46d0f
