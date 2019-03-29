import 'dart:async';
import 'dart:isolate';

main() async {
  // Compute and print a fibonacci sequence synchronously.
  //print(syncFibonacci(20));

  // Compute and print a fiboacci sequence on another thread (isolate).
  for (var i = 0; i<=45; i++) {
  	print("$i ${await asyncFibonacci(i)}");
  }
}


/// User-visible "fiboacci" function that uses an isolate to compute.
Future<dynamic> asyncFibonacci(int n) async {
  final response = new ReceivePort();
  await Isolate.spawn(_isolate, response.sendPort);
  final sendPort = await response.first as SendPort;
  final answer = new ReceivePort();
  sendPort.send([n, answer.sendPort]);
  return answer.first;
}

/// Expected to be created via [Isolate.spawn].
///
/// Sends a [ReceivePort] to [initialReplyTo], waiting for a message that
/// includes as a value for [_fiboacci] and a [SendPort] to respond via.
void _isolate(SendPort initialReplyTo) {
  final port = new ReceivePort();
  initialReplyTo.send(port.sendPort);
  port.listen((message) {
    final data = message[0] as int;
    final send = message[1] as SendPort;
    send.send(syncFibonacci(data));
  });
}

/// Actual implementation.
int syncFibonacci(int n) {
  return n < 2 ? n : syncFibonacci(n - 1) + syncFibonacci(n - 2);
}
