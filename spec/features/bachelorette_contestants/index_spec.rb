require "rails_helper"

RSpec.describe "the bachelorette's contestants index page" do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
    @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
    @cont2 = @bach1.contestants.create!(name: "Rick Leach", age: 32, hometown: "Boston, Massachusetts")
  end

  it "shows the contestants of a bachelorette" do
    visit "/bachelorettes/#{@bach1.id}/contestants"
    expect(page).to have_content("#{@bach1.name}")
    expect(page).to have_content("Bachelorettes:")
    expect(page).to have_content("#{@cont1.name}")
    expect(page).to have_content("#{@cont2.name}")
  end

  it "shows the contestants of a bachelorette" do
    visit "/bachelorettes/#{@bach1.id}/contestants"
    expect(page).to have_content("#{@cont1.name}")
    expect(page).to have_content("Age: #{@cont1.age}")
    expect(page).to have_content("Hometown: #{@cont1.hometown}")
    expect(page).to have_content("#{@cont2.name}")
    expect(page).to have_content("Age: #{@cont2.age}")
    expect(page).to have_content("Hometown: #{@cont2.hometown}")
  end

  it "has a link to the contestant's show page" do
    visit "/bachelorettes/#{@bach1.id}/contestants"
    expect(page).to have_link("#{@cont1.name}")
    click_on("#{@cont1.name}")
    expect(current_path).to eq("/contestants/#{@cont1.id}")
  end

  it "shows a unique list of all the hometowns that these contestants are from" do
    visit "/bachelorettes/#{@bach1.id}/contestants"
    expect(page).to have_content("These Contestants are from these hometowns: Portland, Boston")
  end
end
