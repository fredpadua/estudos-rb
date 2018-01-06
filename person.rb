require 'via_cep'

class Person
  attr_accessor :name, :age, :zipcode, :address

  def initialize(name, age, zipcode)
    @name = name
    @age = age
    @zipcode = zipcode

    get_full_address
  end

  def adult?
    if age >= 18
      true
    else
      false
    end
  end

  def get_full_address
    @address = ViaCep::Address.new(zipcode)
  end
end

person = Person.new('Fred', 21, 28051290)
puts "#{person.name} tem #{person.age} anos e mora em #{person.address.street}, #{person.address.neighborhood} - #{person.address.state}"
