require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a vending machine show page' do
    it "shows me all of the snacks for that machine" do
      sam = Owner.create(name: "Sam's Snacks")
      dons  = sam.machines.create(location: "Don's Mixed Drinks")
      turing = sam.machines.create(location: "Turing Basement")

      kitkat = Snack.create!(name: "Kit Kat")
      chips = Snack.create!(name: 'Chips')

      dons.snacks << kitkat
      turing.snacks << kitkat
      turing.snacks << chips

      
    end
  end
end