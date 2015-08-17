class Food
  attr_reader(:id, :name, :type, :healthy, :restaurant_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
    @healthy = attributes.fetch(:healthy)
    @restaurant_id = attributes.fetch(:restaurant_id)
  end

  define_method(:==) do |another_food|
    self.name().==(another_food.name()).&(self.restaurant_id().==(another_food.restaurant_id())).&(self.type().==(another_food.type())).&(self.healthy().==(another_food.healthy()))
  end

  define_singleton_method(:all) do
    returned_foods = DB.exec("SELECT * FROM foods;")
    foods = []
    returned_foods.each() do |food|
      name = food.fetch("name")
      type = food.fetch("type")
      healthy = food.fetch("healthy")
      restaurant_id = food.fetch("restaurant_id").to_i()
      foods.push(Food.new({:name => name, :type => type, :healthy => healthy, :restaurant_id => restaurant_id}))
    end
    foods
  end

  define_method(:save) do
    DB.exec("INSERT INTO foods (name, type, healthy, restaurant_id) VALUES ('#{@name}', '#{@type}', '#{@healthy}', #{@restaurant_id});")
  end
end
