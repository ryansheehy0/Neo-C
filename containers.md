[Back](./Readme.md)

<!-- TOC -->

- [Structs and Unions](#structs-and-unions)
- [Classes](#classes)

<!-- /TOC -->

# Containers
To prevent the most vexing parsing, Neo-C only allows you to create structs, unions, and class instances with these specific syntaxes.

```C++
// Neo-C
Point pt
Point pt = Point()
Point pt = Point(10, 20)

// Not allowed
Point pt() // The most vexing parse. The compiler thinks this is a function.
Point pt(10, 20)
```

## [Structs and Unions](#containers)
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

- You cannot use `{}`s to initialize structs in Neo-C

## [Classes](#containers)
The changes Neo-C makes to classes:
1. `public`, `protected`, and `private` have to be indented when used.
  - `:`s have been removed from these keywords
1. All private or protected member variables have to have `_` in front of them.
1. The keyword `inherits` is used instead of `:`.
1. Pure virtual methods have the keyword `pure` instead of assigning them to 0s.
1. `override` has to be used if you want to override a virtual method and it has to be put in front instead of at the end.
1. `init` is used instead of `:`s for initializer lists.
1. You have to define all methods inside of the class.
1. You cannot do `Constructor() = default;`. Instead just do `Constructor()`

```C++
// Neo-C
class Animal
  public
    Animal()
    Animal(f64 weight) init _weight(weight)

    pure virtual string name() const
    f64 weight() const return _weight
    void setWeight(f64 weight) _weight = weight

  protected
    f64 _weight = 10.0

class Fox inherits public Animal
  public
    override string name() const return "Fox"

// C++
class Animal {
  public:
    Animal() {}
    Animal(double weight) : _weight(weight) {}

    virtual String_ name() const = 0;
    double weight() const { return _weight; }
    void setWeight(double weight) { _weight = weight; }

  protected:
    double _weight = 10.0;
};

class Fox : public Animal {
  public:
    String_ name() const override { return "Fox"; }
};
```