require "rails_helper"

RSpec.describe "the bachelorettes's show page" do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
    @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
    @cont2 = @bach1.contestants.create!(name: "Rick Leach", age: 32, hometown: "Portland, Oregon")
  end

  it "shows the Bachelorette's name, season number, and description of season" do
    visit "/bachelorettes/#{@bach1.id}"
    expect(page).to have_content("#{@bach1.name}")
    expect(page).to have_content("Season Number: #{@bach1.season_number}")
    expect(page).to have_content("Description of Season: #{@bach1.description}")
  end

  it "shows the link to the bachelorette's contestants" do
    visit "/bachelorettes/#{@bach1.id}"
    expect(page).to have_link("Contestants")
    click_on("Contestants")
    expect(current_path).to eq("/bachelorettes/#{@bach1.id}/contestants")
  end

  it "shows the average age of that bachelorette's contestants" do
    visit "/bachelorettes/#{@bach1.id}"
    expect(page).to have_content("Average Age of Contestants: 29")
  end
end
