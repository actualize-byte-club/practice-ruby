class Vehicle
  def initialize(options_hash)
    @speed = 0
    @direction = 'north'
  end

  def brake
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def turn(new_direction)
    @direction = new_direction
  end
end

class Car < Vehicle
  attr_accessor :make, :model

  def initialize(options_hash)
    super
    @make = options_hash[:make]
    @model = options_hash[:model]
  end

  def honk_horn
    puts "Beeeeeeep!"
  end
end

class Bike < Vehicle
  attr_accessor :type, :weight

  def initialize(options_hash)
    super
    @type = options_hash[:type]
    @weight = options_hash[:weight]
  end

  def ring_bell
    puts "Ring ring!"
  end
end

car = Car.new(make: 'Ford', model: 'F150')
car.brake
car.honk_horn
puts car.make

bike = Bike.new(type: 'Mountain', weight: 20)
bike.accelerate
bike.ring_bell
puts bike.type