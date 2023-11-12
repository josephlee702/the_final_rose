require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it {should have_many :contestants}
  end

  describe "instance methods" do
    before(:each) do 
      @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
      @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
      @cont2 = @bach1.contestants.create!(name: "Rick Leach", age: 32, hometown: "Portland, Oregon")
    end

    describe "#contestants_avg_age" do 
      it "should calculate the average age of all the contestants of this bachelor" do
        expect(@bach1.contestants_avg_age).to eq(29.0)
      end
    end
  end
end
