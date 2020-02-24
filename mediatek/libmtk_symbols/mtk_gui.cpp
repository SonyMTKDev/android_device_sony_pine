#include <stdint.h>
// #include <binder/IBinder.h>
//for 6737
extern "C" {
 void _ZN7android11IDumpTunnel11asInterfaceERKNS_2spINS_7IBinderEEE(){}
}

/*
extern "C" {
 void _ZN7android11IDumpTunnel11asInterfaceERKNS_2spINS_7IBinderEEE(const android::sp<android::IBinder>&) {}
}
*/

extern "C" {
    void _ZN7android14SurfaceControl8setLayerEj(uint32_t);

    void _ZN7android14SurfaceControl8setLayerEi(int32_t layer){
        _ZN7android14SurfaceControl8setLayerEj(static_cast<uint32_t>(layer));
    }
}