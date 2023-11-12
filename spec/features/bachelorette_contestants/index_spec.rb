require "rails_helper"

RSpec.describe "the bachelorette's contestants index page" do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
    @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
    @cont2 = @bach1.contestants.create!(name: "Rick Leach", age: 32, hometown: "Portland, Oregon")
  end

  it "shows the contestants of a bachelorette" do
    visit "/bachelorettes/#{@bach1.id}/contestants"
    expect(page).to have_content("#{@bach1.name}")
    expect(page).to have_content("Bachelors:")
    expect(page).to have_content("#{@cont1.name}")
    expect(page).to have_content("#{@cont2.name}")
  end
end
