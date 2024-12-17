[Back](./Readme.md)

<!-- TOC -->

- [Structs and Unions](#structs-and-unions)
- [Classes](#classes)

<!-- /TOC -->

# Containers
To prevent the most vexing parsing, Neo-C only allows you to create struct, union, and class instances with this specific syntaxes.

```C++
// Neo-C
Point pt
Point pt = Point()
Point pt = Point(10, 20)

// This is not allowed
Point pt() // The most vexing parse. The compiler thinks this is a function.
Point pt(10, 20)
```

## Structs and Unions
In Neo-C, structs and unions cannot have methods and behave similarly to those in C.

```C++
// Neo-C
struct Point
  i64 x
  i64 y

Point pt = Point(10, 20)
  // or
Point pt
pt.x = 10
pt.y = 20

// C++
struct Point {
  int64_t x;
  int64_t y;

  Point(int64_t x, int64_t y) : x(x), y(y) {}
  Point() {}
};

Point pt = Point(10, 20);
  // or
Point pt;
pt.x = 10;
pt.y = 20;
```

- You cannot use `{}`s to initialize structs in Neo-C.

## Classes
The changes Neo-C makes to classes:
1. Access specifiers
  - `public`, `protected`, and `private` must be indented.
  - Colons(`:`) have been removed.
  - You must explicitly specify these keywords. There is not default access.
2. All private or protected member variables must start with an underscore(`_`).
3. Use `inherits` instead of `:`.
4. Use the `pure` keyword instead of assigning it to `0`.
5. The `override` keyword is requirement and must be put in front.
6. Use the `init` keyword indented on its own line instead of `:`s for initializer lists.
7. All methods have to be defined inside the class.
8. Constructors and Destructors
  - Use `This` for constructors and `~This` for destructors.
    - This allows you to rename the class without renaming all the constructors and destructor.
  - Default constructors don't require `= default`, instead do `This()`.
9. You cannot have single line methods. The body has to be indented and placed on its own line.

```C++
// Neo-C
class Animal
  public
    This()
    This(f64 weight)
      init _weight(weight)
    ~This()

    pure virtual string name() const

    f64 weight() const
      return _weight

    void setWeight(f64 weight)
      _weight = weight

  protected
    f64 _weight = 10.0

class Fox inherits public Animal
  public
    override string name() const
      return "Fox"

// C++
class Animal {
  public:
    Animal() {}
    Animal(double weight) : _weight(weight) {}
    ~Animal() {}

    virtual NeoC_String name() const = 0;

    double weight() const {
      return _weight;
    }

    void setWeight(double weight) {
      _weight = weight;
    }

  protected:
    double _weight = 10.0;
};

class Fox : public Animal {
  public:
    NeoC_String name() const override {
      return "Fox";
    }
};
```