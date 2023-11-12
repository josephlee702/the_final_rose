require "rails_helper"

RSpec.describe "the Contestant's show page" do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
    @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
    @out1 = Outing.create!(name: "Skiing", location: "Keystone Mountain", date: '12/12/2020')
    @out2 = Outing.create!(name: "Helicopter Ride", location: "Yosemite", date: '06/12/2020')
    ContestantOuting.create!(contestant: @cont1, outing: @out1)
    ContestantOuting.create!(contestant: @cont1, outing: @out2)
  end

  it "shows the Bachelorette's name, season number, and description of season" do
    visit "/contestants/#{@cont1.id}"
    expect(page).to have_content("#{@cont1.name}")
    expect(page).to have_content("#{@bach1.season_number}")
    expect(page).to have_content("#{@bach1.description}")

    expect(page).to have_content("Outings:")
    expect(page).to have_link("#{@out1.name}")
    expect(page).to have_link("#{@out2.name}")
  end
end
