# rubocop-commsworld

Common [rubocop] configuration and custom cops.
Replaces [commsworld/house-style] which was config-only.

## Installation

Add the gem as a dependency to your project's `Gemfile`:

```ruby
gem "rubocop-commsworld", github: "commsworld/rubocop-commsworld", group: [:development, :test]
```

And install with `bundle install`.

## Usage

Configure rubocop in your project by creating a file in the root directory of the project, `.rubocop.yml`:

```yml
require:
  - rubocop-commsworld
  - rubocop-rails
  - rubocop-rspec
```

## Cops

### Commsworld/UnspecifiedModelPrivacy

Issues an offence when a class is defined within a module which does not have an adjacent privacy definition.
By default, configured to only run on `app/models`.

The motivation is to enforce the use of [Private ActiveRecord models] where appropriate.

```ruby
# bad
module Things
  class Thing < ApplicationRecord
  end
end

# good
module Things
  class Thing < ApplicationRecord
  end

  private_constant :Thing # or public_constant
end
```

## License

The gem is available as open source under the terms of the [MIT License].

[rubocop]: https://github.com/rubocop-hq/rubocop
[commsworld/house-style]: https://github.com/commsworld/house-style
[Private ActiveRecord models]: https://kellysutton.com/2019/10/29/taming-large-rails-codebases-with-private-activerecord-models.html
