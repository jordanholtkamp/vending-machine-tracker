require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a vending machine show page' do
    it "shows me all of the snacks for that machine" do
      sam = Owner.create(name: "Sam's Snacks")
      dons  = sam.machines.create(location: "Don's Mixed Drinks")
      turing = sam.machines.create(location: "Turing Basement")

      kitkat = Snack.create!(name: "Kit Kat", price: 1.50)
      chips = Snack.create!(name: 'Chips', price: 2.00)

      dons.snacks << kitkat
      turing.snacks << kitkat
      turing.snacks << chips

      visit "/machines/#{dons.id}"

      expect(page).to have_content(kitkat.name)
      expect(page).to have_content(kitkat.price)
      expect(page).to_not have_content(chips.name)
      expect(page).to_not have_content(chips.price)
    end
  end
end