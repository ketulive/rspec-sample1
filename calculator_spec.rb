def calc(expression)
  nums = expression.scan(/\d+/)
  result = 1
  nums.each do |num|
    result *= num.to_i
  end
  result
end

describe "calculator" do
  it "15*5 = 75" do
    expect(calc("15*5")).to eq 75
  end
end
