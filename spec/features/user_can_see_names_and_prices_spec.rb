require "rails_helper"

RSpec.describe "As a user" do
  describe "When I visit a vending machine show page" do
    before :each do
      owner = Owner.create!(name: "Turing")
      @machine_1 = owner.machines.create(location: "Basement")

      @burger = @machine_1.snacks.create!(name: "White Castle Burger", price: 3.50)
      @pop_rocks = @machine_1.snacks.create!(name: "Pop Rocks", price: 1.50)
      @cheetos = @machine_1.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)
    end

    it "I see the name of all of the snacks associated with that vending machine along with their price" do
      visit machine_path(@machine_1)

      within("#snack-#{@burger.id}-info") do
      expect(page).to have_content("White Castle Burger")
      expect(page).to have_content("$3.50")
      end

      within("#snack-#{@pop_rocks.id}-info") do
      expect(page).to have_content("Pop Rocks")
      expect(page).to have_content("$1.50")
      end

      within("#snack-#{@cheetos.id}-info") do
      expect(page).to have_content("Flaming Hot Cheetos")
      expect(page).to have_content("$2.50")
      end
    end
  end
end
