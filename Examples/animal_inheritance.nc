// Animal ----------------------------------------------------------------------
class Animal
	public
		Animal()
		Animal(f64 weight)
			init _weight(weight)

		f64 weight() const
			return _weight
		pure virtual string name() const
		virtual bool canEat(const Animal& animal) const
			return animal.name() == name()

	private
		f64 _weight

	protected
		void setWeight(f64 weight)
			_weight = weight

// Fox -------------------------------------------------------------------------

class Fox inherits public Animal
	public
		override string name() const return "Fox"
		override bool canEat(const Animal& animal) const
			return animal.name() == "Rabbit"

// Rabbit ----------------------------------------------------------------------

class Rabbit inherits public Animal
	public
		override string name() const return "Rabbit"
		override bool canEat(const Animal& animal) const
			return animal.name() == "Grasshopper"

// Grasshopper -----------------------------------------------------------------

class Grasshopper inherits public Animal
	public
		override string name() const return "Grasshopper"
		override bool canEat(const Animal& animal) const return false

// Cage ------------------------------------------------------------------------

class Cage
	public
		Cage()

		u64 count() const return _animals.size()
		void addAnimal(Animal* animal) _animals.push(animal)

	private
		Animal*[dynamic] _animals