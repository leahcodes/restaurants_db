require('spec_helper')

describe(Food) do

  describe("#==") do
    it('is the same food if it has the same name') do
      food1 = Food.new(:name => 'grass fed beef', :type => "meat", :healthy => 't', :restaurant_id => 1)
      food2 = Food.new(:name => 'grass fed beef', :type => "meat", :healthy => 't', :restaurant_id => 1)
      expect(food1).to(eq(food2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Food.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves food into array of saved foods') do
      food1 = Food.new(:name => 'grass fed beef', :type => "meat", :healthy => 't', :restaurant_id => 1)
      food1.save()
      expect(Food.all()).to(eq([food1]))
    end
  end

end
