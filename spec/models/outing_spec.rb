require "rails_helper"

RSpec.describe Outing, type: :model do
  describe "relationships" do
    it {should have_many(:contestants).through(:contestant_outings)}
  end

  describe "instance methods" do
    before(:each) do
      @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
      @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
      @out1 = Outing.create!(name: "Skiing", location: "Keystone Mountain", date: '12/12/2020')
      ContestantOuting.create!(contestant: @cont1, outing: @out1)
    end

    describe "#contestant_count" do
      it "calculates the total number of contestants who went on an outing" do
      expect(@out1.contestant_count).to eq(1)
      end
    end

    describe "#remove_contestant" do
      it "removes the contestant from the outing" do
      @out1.remove_contestant(@cont1)
      expect(@out1.contestants).to eq([])
      end
    end
  end
end
