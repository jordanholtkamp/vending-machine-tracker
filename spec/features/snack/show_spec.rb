require 'rails_helper'

describe 'On the snack show page' do
  it "shows the locations of the snack" do
    sam = Owner.create(name: "Sam's Snacks")

    turing = sam.machines.create(location: "Turing Basement")
    dons = sam.machines.create!(location: "Don's Mixed Srinks")

    kitkat = Snack.create!(name: "Kit Kat", price: 1.50)
    chips = Snack.create!(name: 'Chips', price: 2.00)
    cheetos = Snack.create!(name: 'Cheetos', price: 2.50)

    turing.snacks << kitkat
    turing.snacks << chips
    turing.snacks << cheetos
    dons.snacks << cheetos

    visit "/snacks/#{cheetos.id}"

    expect(page).to have_content(turing.location)
    expect(page).to have_content(dons.location)
  end
end