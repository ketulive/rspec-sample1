def calc(expression)
  op = expression.scan(/\*|\+/).first
  expression.scan(/\d+/).map(&:to_i).inject(&op.to_sym)
end

describe "calculator" do
  it "15*5 = 75" do
    expect(calc("15*5")).to eq 75
  end

  it "15+5 = 20" do
    expect(calc("15+5")).to eq 20
  end
end
