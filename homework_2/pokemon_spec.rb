require "rspec"
require "./pokemon"

RSpec.describe "add" do
  it "returns array of pokemons" do
  count = 2
  result = [
    { name: "Pikachu", color: "Yellow"},
    { name: "Ruby", color: "Red"}
  ]

    allow_any_instance_of(Kernel).to receive(:gets).and_return("Pikachu", "Yellow", "Ruby", "Red")
    
    expect(add(count)).to eq(result)
  end
end
