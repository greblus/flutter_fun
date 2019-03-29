void main() async {
  print("Begining of main().");
  getsomevalue().then(print);
  
  for (var i = 0; i<5; i++)
    await print("main's: $i");
  print("End of main().");
}

getsomevalue() async {
  for (var i=0; i<5; i++)
    await print("getsomevalue's: $i");
  return Future.delayed(Duration(seconds: 3), () => "Hello from the Future!");
}

//Begining of main().
//getsomevalue's: 0
//main's: 0
//getsomevalue's: 1
//main's: 1
//getsomevalue's: 2
//main's: 2
//getsomevalue's: 3
//main's: 3
//getsomevalue's: 4
//main's: 4
//End of main().
//Hello from the Future!
