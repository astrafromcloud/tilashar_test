import 'dart:math';

void main() {
  List<double> x = [6, 3.8, -9.3, 2.87, 16, 5, 0.2, -3.1, 1, 10];

  int a = x.length;

  List<double> y = [];

  double first = 0;

  for(int i = 0; i < x.length; i++) {
    y.add(sqrt(first + x[i]));
    first += x[i];
  }

  y.forEach((element) {print(element);});
}
