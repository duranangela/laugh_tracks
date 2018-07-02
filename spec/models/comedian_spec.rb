RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end
      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
  describe 'Class Methods' do
    describe 'Average Age' do
      it 'should give the average age of all comedians' do
        Comedian.create(name: 'Bob', age: 27)
        Comedian.create(name: 'Mary', age: 25)
        Comedian.create(name: 'Fred', age: 28)
        Comedian.create(name: 'Alice', age: 24)

        expect(Comedian.average_age).to eq(26)
      end
      it 'should give the count of specials per comedian' do
        bob = Comedian.create(name: 'Bob', age: 27)
        mary = Comedian.create(name: 'Mary', age: 25)
        bob.specials.create(name: 'Special1')
        bob.specials.create(name: 'Special2')
        mary.specials.create(name: 'Special3')

        expect(bob.specials_count).to eq(2)
        expect(mary.specials_count).to eq(1)
      end
    end
  end
end
