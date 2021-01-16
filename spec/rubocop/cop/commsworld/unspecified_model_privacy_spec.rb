RSpec.describe RuboCop::Cop::Commsworld::UnspecifiedModelPrivacy do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it "registers an offense if a class in a module doesn't have an adjacent `private_constant` declaration" do
    expect_offense(<<~RUBY)
      module Component
        class Model
        ^^^^^^^^^^^ Specify an access modifier for namespaced class `Model` with either `private_constant :Model` or `public_constant :Model`
        end
      end
    RUBY
  end

  it "does not register an offense if a class in a module has an adjacent `private_constant` declaration" do
    expect_no_offenses(<<~RUBY)
      module Component
        class Model
        end

        private_constant :Model
      end
    RUBY
  end

  it "does not register an offense if a class isn't in a module" do
    expect_no_offenses(<<~RUBY)
      class Model
      end
    RUBY
  end
end
