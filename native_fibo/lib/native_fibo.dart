import 'package:flutter/services.dart';

import 'dart:ffi';  // For FFI
import 'dart:io';   // For Platform.isX

final DynamicLibrary nativeFiboLib =
  Platform.isAndroid
    ? DynamicLibrary.open("libnative_fibo.so")
    : DynamicLibrary.open("native_fibo.framework/native_fibo");

final int Function(int x) native_fibo =
  nativeFiboLib
    .lookup<NativeFunction<Int32 Function(Int32)>>("native_fibo")
    .asFunction();

class NativeFibo {
  static const MethodChannel _channel =
      const MethodChannel('native_fibo');
}
