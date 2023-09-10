import 'dart:math';

// Interface Shape
abstract class Shape {
  double getArea();
  double getPerimeter();
}

// Class Circle
class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double getArea() {
    return pi * radius * radius;
  }

  @override
  double getPerimeter() {
    return 2 * pi * radius;
  }
}

// Class Rectangle
class Rectangle implements Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double getArea() {
    return length * width;
  }

  @override
  double getPerimeter() {
    return 2 * (length + width);
  }
}

// Class Triangle
class Triangle implements Shape {
  double side1;
  double side2;
  double side3;

  Triangle(this.side1, this.side2, this.side3);

  @override
  double getArea() {
    double s = (side1 + side2 + side3) / 2;
    return sqrt(s * (s - side1) * (s - side2) * (s - side3));
  }

  @override
  double getPerimeter() {
    return side1 + side2 + side3;
  }
}

void main() {
  Circle circle = Circle(5.0);
  Rectangle rectangle = Rectangle(4.0, 6.0);
  Triangle triangle = Triangle(3.0, 4.0, 5.0);

  print('Luas dan Keliling Bangun Datar:');
  print('Lingkaran - Luas: ${circle.getArea()}, Keliling: ${circle.getPerimeter()}');
  print('Persegi Panjang - Luas: ${rectangle.getArea()}, Keliling: ${rectangle.getPerimeter()}');
  print('Segitiga - Luas: ${triangle.getArea()}, Keliling: ${triangle.getPerimeter()}');
}
