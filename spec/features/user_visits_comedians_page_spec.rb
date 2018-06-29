RSpec.describe 'a visitor visits comedians page' do
  it 'they see a list of comedians with name and age' do
    Comedian.create(name: 'Bob', age: 27)

    visit '/comedians'

    within('#greeting') do
      expect(page).to have_content('Welcome to Comedians!')
    end
    expect(page).to have_content('Bob')
    expect(page).to have_content(27)
  end
  it 'they see a list of specials for each comedian' do
    Comedian.create(name: 'Bob', age: 27)
    Special.create(name: "Bob's Special", comedian_id: 1)

    visit '/comedians'

    expect(page).to have_content("Bob's Special")
  end
  it 'they see the average age for all comedians' do
    Comedian.create(name: 'Bob', age: 27)
    Special.create(name: "Bob's Special", comedian_id: 1)
    Comedian.create(name: 'Mary', age: 25)

    visit '/comedians'
    save_and_open_page

    expect(page).to have_content(26)    
  end
end
