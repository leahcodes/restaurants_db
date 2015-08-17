class Restaurant
  attr_reader(:id, :name, :type, :capacity, :expensive)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
    @capacity = attributes.fetch(:capacity)
    @expensive = attributes.fetch(:expensive)
  end

  define_method(:==) do |another_restaurant|
    self.name().==(another_restaurant.name()).&(self.id().==(another_restaurant.id())).&(self.type().==(another_restaurant.type())).&(self.capacity().==(another_restaurant.capacity())).&(self.expensive().==(another_restaurant.expensive()))
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM restaurants;")
    restaurants = []
    returned_restaurants.each() do |restaurant|
      id = restaurant.fetch("id").to_i()
      name = restaurant.fetch("name")
      type = restaurant.fetch("type")
      capacity = restaurant.fetch("capacity").to_i()
      expensive = restaurant.fetch("expensive")
      restaurants.push(Restaurant.new({:id => id, :name => name, :type => type, :capacity => capacity, :expensive => expensive}))
    end
    restaurants
  end

  define_method(:save) do
    DB.exec("INSERT INTO restaurants (id, name, type, capacity, expensive) VALUES (#{@id}, '#{@name}', '#{@type}', #{@capacity}, '#{@expensive}');")
  end
end
