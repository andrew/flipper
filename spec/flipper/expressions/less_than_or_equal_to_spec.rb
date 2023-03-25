RSpec.describe Flipper::Expressions::LessThanOrEqualTo do
  describe "#evaluate" do
    it "returns true when equal" do
      expression = described_class.new([2, 2])

      expect(expression.evaluate).to be(true)
    end

    it "returns true when equal with args that need evaluation" do
      expression = described_class.new([
        Flipper.number(2),
        Flipper.number(2),
      ])

      expect(expression.evaluate).to be(true)
    end

    it "returns true when less" do
      expression = described_class.new([1, 2])

      expect(expression.evaluate).to be(true)
    end

    it "returns false when greater" do
      expression = described_class.new([2, 1])
      expect(expression.evaluate).to be(false)
    end

    it "returns false when value evaluates to nil" do
      expect(described_class.new([Flipper.number(nil), 1]).evaluate).to be(false)
      expect(described_class.new([1, Flipper.number(nil)]).evaluate).to be(false)
    end

    it "raises ArgumentError with no arguments" do
      expect { described_class.new([]).evaluate }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError with one argument" do
      expect { described_class.new([10]).evaluate }.to raise_error(ArgumentError)
    end
  end

  describe "#value" do
    it "returns Hash" do
      expression = described_class.new([
        Flipper.number(20),
        Flipper.number(10),
      ])

      expect(expression.value).to eq({
        "LessThanOrEqualTo" => [20, 10],
      })
    end
  end
end
