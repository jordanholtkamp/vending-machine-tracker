require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a vending machine show page' do
    it "shows me all of the snacks for that machine" do
      sam = Owner.create(name: "Sam's Snacks")
      dons = sam.machines.create!(location: "Don's Mixed Srinks")
      turing = sam.machines.create(location: "Turing Basement")

      kitkat = Snack.create!(name: "Kit Kat", price: 1.50)
      chips = Snack.create!(name: 'Chips', price: 2.00)
      cheetos = Snack.create!(name: 'Cheetos', price: 2.50)

      dons.snacks << kitkat
      turing.snacks << kitkat
      turing.snacks << chips

      visit "/machines/#{dons.id}"

      expect(page).to have_content(kitkat.name)
      expect(page).to have_content(kitkat.price)
      expect(page).to_not have_content(chips.name)
    end

    it "shows me an average price of all snacks in the machine" do
      sam = Owner.create(name: "Sam's Snacks")

      turing = sam.machines.create(location: "Turing Basement")

      kitkat = Snack.create!(name: "Kit Kat", price: 1.50)
      chips = Snack.create!(name: 'Chips', price: 2.00)
      cheetos = Snack.create!(name: 'Cheetos', price: 2.50)

      turing.snacks << kitkat
      turing.snacks << chips
      turing.snacks << cheetos

      visit "/machines/#{turing.id}"

      expect(page).to have_content("Average Price: #{turing.average_price}")
    end
  end
end