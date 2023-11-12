require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it {should belong_to :bachelorette}
    it {should have_many(:outings).through(:contestant_outings)}
  end

  describe "instance methods" do
    describe "#hometown_only" do
      it "should only return the town of a contestant's hometown" do
        bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
        cont1 = bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
        expect(cont1.hometown_only).to eq("Portland")
      end
    end
  end
end
