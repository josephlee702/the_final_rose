require "rails_helper"

RSpec.describe "the outing's show page" do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
    @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
    @out1 = Outing.create!(name: "Skiing", location: "Keystone Mountain", date: '12/12/2020')
    @out2 = Outing.create!(name: "Helicopter Ride", location: "Yosemite", date: '06/12/2020')
    ContestantOuting.create!(contestant: @cont1, outing: @out1)
    ContestantOuting.create!(contestant: @cont1, outing: @out2)
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

  it "has a link to remove the contestant from the outing" do 
    visit "/outings/#{@out1.id}"
    expect(page).to have_button("Remove")
    click_on("Remove")
    expect(current_path).to eq("/outings/#{@out1.id}")
    expect(page).to_not have_content("#{@cont1.name}")
  end

  it "still shows that contestant for another outing after I remove them from the first outing" do 
    visit "/outings/#{@out2.id}"
    expect(page).to have_content(@cont1.name)
  end
end
