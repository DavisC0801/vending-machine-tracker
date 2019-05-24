require "rails_helper"

RSpec.describe "As a visitor" do
  describe "When I visit a vending machine show page" do
    before :each do
      owner = Owner.create!(name: "Turing")
      @machine_1 = owner.machines.create(location: "Basement")

      @burger = @machine_1.snacks.create!(name: "White Castle Burger", price: 3.50)
      @pop_rocks = @machine_1.snacks.create!(name: "Pop Rocks", price: 1.50)
      @cheetos = @machine_1.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)
    end

    it "I also see an average price for all of the snacks in that machine" do
      visit machine_path(@machine_1)

      expect(page).to have_content("Average Price: $2.50")
    end
  end
end
