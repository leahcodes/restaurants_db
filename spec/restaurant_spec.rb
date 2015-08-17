require('spec_helper')

describe(Restaurant) do

  describe("#==") do
    it("is the same restaurant if it has the same name") do
      restaurant1 = Restaurant.new({:name => "Dennys", :id => 1, :type => "American", :capacity  => 100, :expensive => 'f'})
      restaurant2 = Restaurant.new({:name => "Dennys", :id => 1, :type => "American", :capacity  => 100, :expensive => 'f'})
      expect(restaurant1).to(eq(restaurant2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Restaurant.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a restaurant to the array of saved restaurants') do
      restaurant1 = Restaurant.new({:id => 1,:name => "Dennys", :type => "American", :capacity  => 100, :expensive => 'f'})
      restaurant1.save()
      expect(Restaurant.all()).to(eq([restaurant1]))
    end
  end

end
