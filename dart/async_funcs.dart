
count1() async {
	for (var i = 0; i<10; i++) 
  	await print("c1: $i");
  print("c1: finished!");
}

count2() async {
	for (var i = 0; i<10; i++) 
  	await print("c2: $i");
  print("c2: finished!");
}

main() {
	count1(); 
  count2();  
}
