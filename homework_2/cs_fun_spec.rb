require "rspec"
require "./cs_fun"

RSpec.describe "task_two" do
  it "return 2 raised to word length if word contains `CS` in the end" do
    expect(cs_fun("qCS")).to eq(8)
  end

  it "return reverse word if it dosn`t contains `CS` in the end" do
    expect(cs_fun("qwe")).to eq("ewq")
  end
end



