RSpec.describe 'a visitor visits comedians page' do
  it 'they see a list of comedians with name and age' do
    bob_the_comic = Comedian.create(name: 'Bob', age: 27)

    visit '/comedians'

    within('#greeting') do
      expect(page).to have_content('Welcome to Comedians!')
    end
    expect(page).to have_content(bob_the_comic.name)
    expect(page).to have_content(bob_the_comic.age)
  end
  it 'they see a list of specials for each comedian' do
    bob_the_comic = Comedian.create(name: 'Bob', age: 27)
    bob_the_comic.specials.create(name: "Bob's Special")

    visit '/comedians'

    expect(page).to have_content("Bob's Special")
  end
  it 'they see the average age for all comedians' do
    Comedian.create(name: 'Bob', age: 27)
    Comedian.create(name: 'Mary', age: 25)
    Comedian.create(name: 'Fred', age: 28)
    Comedian.create(name: 'Alice', age: 24)

    visit '/comedians'

    expect(page).to have_content(26)
  end
end
