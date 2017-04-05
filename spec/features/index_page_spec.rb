require "spec_helper"

feature "user sees alphabetical list of each meetup" do
  meetup_one = FactoryGirl.create(:meetup)
  meetup_two = FactoryGirl.create(:meetup, name: "Ruby in Space")
  meetup_two = FactoryGirl.create(:meetup, name: "Ruby on Mars", location: "Mars")

  user_one = FactoryGirl.create(:user)


  scenario "user sees the index page" do

    visit "/meetups"
    expect(page).to have_content("Meetups!")
  end

  scenario "user sees alphabetical list of meetups on index page" do
    visit "/meetups"
    binding.pry

    expect(page).to have_content "#{meetup_one.name}"
  end

end
