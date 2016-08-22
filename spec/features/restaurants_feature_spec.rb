require 'rails_helper'

feature 'restaurants' do

  context 'no restaurants have been added' do
    scenario 'no restaurants have been added' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Jack & Mali\'s Meat Hook')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('Jack & Mali\'s Meat Hook')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

end
