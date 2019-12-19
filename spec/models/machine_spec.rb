require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'model methods' do
    describe 'average_price' do
      it "gives average prive of all snacks in a machine" do
        sam = Owner.create(name: "Sam's Snacks")

        turing = sam.machines.create(location: "Turing Basement")

        kitkat = Snack.create!(name: "Kit Kat", price: 1.50)
        chips = Snack.create!(name: 'Chips', price: 2.00)
        cheetos = Snack.create!(name: 'Cheetos', price: 2.50)

        turing.snacks << kitkat
        turing.snacks << chips
        turing.snacks << cheetos

        expect(turing.average_price).to eq(2.00)
      end
    end
  end
end
