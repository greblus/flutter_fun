class X {
  X() { 
    print("X's default constructor"); 
  }
  
  X.ndef() {
    print("X's named constructor");
  } 
 
}

class Y extends X {
  final a, b;
  Y(this.a, this.b) { print("Y's default"); } 
  Y.named(this.a, this.b, c) {
    print(c);
  }
  p() { print("Y's ${a}, ${b}"); }
} 

main() {
  var y = Y(666, 666);
  var z = Y.named(667, 668, 669);  
  y.p();
  z.p();
}
