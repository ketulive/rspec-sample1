def calc(expression)
  result = expression.scan(/\*|\+|\&|\||\d+/)
  %w(| & + *).each do |op|
    while result.include? op
      pos = result.index(op)
      res = result[pos-1].to_i.send(op, result[pos+1].to_i)
      result[pos-1..pos+1] = res
    end
  end
  result.first
end

def _calc(expressions)
  pos = expressions.index("+")
  op = expressions[pos]
  left = expressions[pos-1].to_i
  right = expressions[pos+1].to_i
  res = left.send(op, right)
  expressions[pos-1..pos+1] = res.to_s
  expressions
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

  it "30*15+5 = 600" do
    expect(calc("30*15+5")).to eq 600
  end

  it "30*15+5 -> 30*20" do
    expect(_calc(["30", "*", "15", "+", "5"])).to eq ["30", "*", "20"]
  end
end
