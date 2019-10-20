#include <stdint.h>
#include <algorithm>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_fibo(int32_t n) {
	int32_t a = 0, b = 1;
	for (int i=0; i<n; i++) {
			std::swap(a, b);
	   b += a;
	}
	return a;
};

