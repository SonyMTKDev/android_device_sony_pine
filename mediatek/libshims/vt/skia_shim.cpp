#include "SkBitmap.h"
#include "SkColorTable.h"

extern "C" {
	 void _ZN14SkImageDecoder10DecodeFileEPKcP8SkBitmap11SkColorTypeNS_4ModeEPNS_6FormatE() {}
     void _ZN14SkImageEncoder10EncodeFileEPKcRK8SkBitmapNS_4TypeEi() {}
     void _ZN15SkMemoryWStreamC1EPvj() {}
}

extern "C" void _ZN8SkBitmap14tryAllocPixelsEPNS_9AllocatorE(SkBitmap::Allocator* allocator);

extern "C" void _ZN8SkBitmap14tryAllocPixelsEPNS_9AllocatorEP12SkColorTable(SkBitmap::Allocator* allocator, SkColorTable* ctable) {
    _ZN8SkBitmap14tryAllocPixelsEPNS_9AllocatorE(allocator);
}