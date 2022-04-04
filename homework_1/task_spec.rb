require "rspec"
require "./task"

RSpec.describe "Task" do
  it "returns greeting message if user older than 18" do
    expect(greeting(18,"Name","Last_name")).to eq("Привет, Name Last_name. Самое время заняться делом!")
  end

  it "returns greeting message when user's age is under 18" do
    expect(greeting(17,"Name","Last_name")).to eq("Привет, Name Last_name. Тебе меньше 18 лет, но начать учиться программировать никогда не рано.")
  end

  it "when array contain 20" do
    expect(foobar(array=[1,20])).to eq(array[1])
  end

  it "when array doesn't contain 20" do
    expect(foobar(array=[4,15])).to eq(array.sum)
  end
end