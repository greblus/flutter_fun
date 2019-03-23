
class T1 {
  void f1() {
    print("f1");
  }
}

class T2 {
  void f2() {
    print("f2");
  }
}

abstract class T3 {
	void f3();  
}

class T4 extends T1 with T2 implements T3 {
  f3() { print("f3"); }
  f4() { print("f4"); }
} 

void main() {
	
  var t = T4();
  t.f1();
  t.f2();
  t.f3();  
  t.f4();
}

