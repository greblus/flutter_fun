import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_fibo/native_fibo.dart';

void main() {
  const MethodChannel channel = MethodChannel('native_fibo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NativeFibo.platformVersion, '42');
  });
}
