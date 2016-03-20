# Franklin

Franklin is a command line utility, written in ruby, that allows searching public libraries powered by Overdrive. It supports multiple library searching for those that have accounts in more than one library (city, county, state, etc.)

## Installation

Install gem:

    $ gem install franklin

## Configuration

Franklin needs to be configured with information about the Overdrive libraries it will search. It expects a file in YAML format to exist in your home directory called `.franklin`. The contents of the file should look like:

``` yml
---
:libraries:
  - :name: San Francisco Public Library
    :url: http://sfpl.lib.overdrive.com
  - :name: San Diego Public Library
    :url: http://sdpl.lib.overdrive.com
:default_type: eBook # Optional, will show all types if not set.
```

There needs to be a minimum of one library, but there is no maximum. The `name` can be anything and will be included when the search results are presented. The `url` should point to the domain of the public library. It can be obtained by visiting Overdrive's site for each library, copying the url and stripping everything after the domain name.

## Usage

Once the library has been installed and configured, the `franklin` executable will be available. It can be called from the command line with the list of terms to be searched for:

```
$ franklin chamber of secrets
Searched for: chamber of secrets
======================================================
Harry Potter and the Chamber of Secrets
By J.K. Rowling
Format: Audiobook
Availability:
  2.8 people/copy @ San Francisco Public Library
  15.5 people/copy @ San Diego Public Library
  1.3 people/copy @ San Diego County Library
  5.4 people/copy @ Los Angeles County Library
======================================================
Harry Potter and the Chamber of Secrets
By J.K. Rowling
Format: eBook
Availability:
  0.9 people/copy @ San Francisco Public Library
  Available @ San Diego Public Library
  0.6 people/copy @ San Diego County Library
  0.0 people/copy @ Los Angeles County Library
======================================================
Harry Potter
By Chris Peacock
Format: eBook
Availability:
  2.5 people/copy @ San Francisco Public Library
  1.0 people/copy @ San Diego Public Library
======================================================
Room at Heron's Inn
By Ginger Chambers
Format: eBook
Availability:
  Available @ San Francisco Public Library
======================================================
The Secret of the Fiery Chamber
By Carolyn Keene
Format: eBook
Availability:
  Available @ San Diego County Library
```

Franklin supports using a different path for the configuration file and filtering results by type (ie,  eBook, Audiobook, etc).

See `franklin --help` for more information.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ylansegal/franklin.

## License

This software is provided under the terms of the MIT license. See LICENSE.txt for more information
