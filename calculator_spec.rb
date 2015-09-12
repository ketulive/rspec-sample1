def calc(expression)
  op = expression.scan(/\*|\+/).first
  nums = expression.scan(/\d+/)
  result = nil
  nums.each do |num|
    if result
      case op
      when "*"
        result *= num.to_i
      else
        result += num.to_i
      end
    else
      result = num.to_i
    end
  end
  result
end

describe "calculator" do
  it "15*5 = 75" do
    expect(calc("15*5")).to eq 75
  end

  it "15+5 = 20" do
    expect(calc("15+5")).to eq 20
  end
end
