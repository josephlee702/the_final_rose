require "rails_helper"

RSpec.describe "the outing's show page" do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
    @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
    @out1 = Outing.create!(name: "Skiing", location: "Keystone Mountain", date: '12/12/2020')
    ContestantOuting.create!(contestant: @cont1, outing: @out1)
  end

  it "shows the outing's name, location, and date" do
    visit "/outings/#{@out1.id}"
    expect(page).to have_content(@out1.name)
    expect(page).to have_content("Location: #{@out1.location}")
    expect(page).to have_content("Date: #{@out1.date}")
  end

  it "shows the total count and names of contestants who went on this outing" do
    visit "/outings/#{@out1.id}"
    expect(page).to have_content("Total Count of Contestants: 1")
    expect(page).to have_content("Contestants")
    expect(page).to have_content("#{@cont1.name}")
  end
end
