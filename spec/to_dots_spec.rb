require 'delegate'

RSpec.describe ToDots do
  it "has a version number" do
    expect(ToDots::VERSION).not_to be nil
  end

  class HashDelegator < SimpleDelegator; end

  [
    [
      {foo: :bar},
      ['foo.bar']
    ],
    [
      {foo: :bar, bar: :foo},
      ['foo.bar', 'bar.foo']
    ],
    [
      {foo: {bar: :baz}},
      ['foo.bar.baz']
    ],
    [
      [{bar: :baz}, {baz: :bar}],
      ['bar.baz', 'baz.bar']
    ],
    [
      {foo: [{bar: :baz}, {baz: :bar}]},
      ['foo.bar.baz', 'foo.baz.bar']
    ],
    [
      {foo: [{bar: :baz}, {baz: :bar}], baz: {bar: :foo}},
      ['foo.bar.baz', 'foo.baz.bar', 'baz.bar.foo']
    ],
    [
      {foo: [HashDelegator.new(bar: :baz), HashDelegator.new(baz: :bar)], baz: HashDelegator.new(bar: :foo)},
      ['foo.bar.baz', 'foo.baz.bar', 'baz.bar.foo']
    ],
  ].each do |(input,output)|
    it{ expect(described_class.to_dots(input)).to eq(output) }
  end
end
