def calc(expression)
  op = expression.scan(/\*|\+|\&|\|/)
  expression.scan(/\d+/).map(&:to_i).inject do|sum, n|
    sum.send(op.shift, n)
  end
end

describe "calculator" do
  it "15*5 = 75" do
    expect(calc("15*5")).to eq 75
  end

  it "15+5 = 20" do
    expect(calc("15+5")).to eq 20
  end

  it "15&5 = 5" do
    expect(calc("15&5")).to eq 5
  end

  it "15|5 = 15" do
    expect(calc("15|5")).to eq 15
  end

  it "30+15*5 = 225" do
    expect(calc("30+15*5")).to eq 225
  end
end
