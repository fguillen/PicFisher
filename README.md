# PicFisher

Send the fisher to fish your images for you. Give it a list of image urls in a flexible
formatted text file and it will go fishing to the internet for you

## Installation

```
gem install picfisher
```

## Usage

```
picfisher [images_file_path] [output_directory_path]
```

For example:

```
mkdir ~/Downloads/fished_images
picfisher images.txt ~/Downloads/fished_images
```

With log

```
DEBUG_LEVEL=debug picfisher images.txt ~/Downloads/fished_images
```

Accepted values for `DEBUG_LEVEL`: `debug`, `info`, `error`, `silence`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Use `exe/picfisher` to try your development version of the command line command.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fguillen/PicFisher.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
