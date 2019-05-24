require "rails_helper"

RSpec.describe "As a visitor" do
  describe "When I visit a snack show page" do
    before :each do
      owner = Owner.create!(name: "Turing")
      @machine_1 = owner.machines.create(location: "Basement")
      @machine_2 = owner.machines.create(location: "My house for some reason")

      @burger = @machine_1.snacks.create!(name: "White Castle Burger", price: 3.50)
      @pop_rocks = @machine_1.snacks.create!(name: "Pop Rocks", price: 1.50)
      @cheetos = @machine_1.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)

      @machine_2.snacks << @burger
      @machine_2.snacks << @pop_rocks
    end

    it "I see the name of that snack" do
      visit snack_path(@burger)

      expect(page).to have_content(@burger.name)
    end

    it "shows a price for that snack" do
      visit snack_path(@burger)

      expect(page).to have_content("$3.50")
    end

    it " shows a list of locations with vending machines that carry that snack" do
      visit snack_path(@burger)

      expect(page).to have_content(@machine_1.location)
      expect(page).to have_content(@machine_2.location)
    end

    it "shows the average price for snacks in those vending machines" do
      visit snack_path(@burger)

      "average price of $2.50)"
    end

    it "shows a count of the different kinds of items in that vending machine." do
      visit snack_path(@burger)

      expect(page).to have_content("(3 kinds of snacks, ")
    end
  end
end
