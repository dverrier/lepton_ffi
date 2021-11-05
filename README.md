# Lepton_FFI

Welcome to Lepton_FFI! 
This is a ruby wrapper to the Leptonica library. 



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lepton_ffi'
```

And then execute:
```bash
    $ bundle install
```
Or install it yourself as:
```bash
    $ gem install lepton_ffi
```

## Usage
The fastest way to get going is to use the high-level functions that will probably suit most people , most of the time.

## Low Level Calls

If you look under the hood, there are intermediate ruby methods that do most things, and some very low level functions that make calls to the C-API of Tesseract using the wonderful FFI library. The low level functions give alarming error messages and often stack dump if called in the wrong order, so they are not for the feint of heart. But if your screen allows to scroll back 1000 lines, you can usually see where the call to Tesseract went wrong. This gem aims to hide the complexity of the direct calls to the C library. The examples directory includes a couple of files that show the way to proceed at the different levels of complexity and the tests show more usage.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dverrier/lepton_ffi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dverrier/lepton_ffi/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lepton_FFI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dverrier/lepton_ffi/blob/master/CODE_OF_CONDUCT.md).
