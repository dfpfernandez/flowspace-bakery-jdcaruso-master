feature 'Cooking cookies' do
  scenario 'Cooking a single cookie' do
    user = create_and_signin
    oven = user.ovens.first

    visit oven_path(oven)

    expect(page).to_not have_content 'Chocolate Chip'
    expect(page).to_not have_content 'Your Cookie is Ready'

    find('.oven-desktop').click_link_or_button('Prepare Cookie')
    fill_in 'Fillings', with: 'Chocolate Chip'
    click_button 'Mix and bake'

    expect(current_path).to eq(oven_path(oven))
    expect(page).to have_content 'Chocolate Chip'
    expect(page).to have_content 'Cookie in oven'
  end

  scenario 'Trying to bake a cookie while oven is full' do
    user = create_and_signin
    oven = user.ovens.first

    oven = FactoryGirl.create(:oven, user: user)
    visit oven_path(oven)

    find('.oven-desktop').click_link_or_button('Prepare Cookie')
    fill_in 'Fillings', with: 'Chocolate Chip'
    click_button 'Mix and bake'

    find('.oven-desktop').click_link_or_button('Prepare Cookie')
    expect(page).to have_content 'A set of cookies are already in the oven!'
    expect(current_path).to eq(oven_path(oven))
    expect(page).to_not have_button 'Mix and bake'
  end
end
