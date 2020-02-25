#include <ui/GraphicBufferMapper.h>
#include <ui/PixelFormat.h>
#include <ui/Rect.h>
#define LOG_TAG "HW_CAM_SHIM"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <utils/Log.h>
#include <hardware/power.h>
#include <hardware/hardware.h>

void _ZN7android14CameraMetadata14getTagFromNameEPKcPKNS_19VendorTagDescriptorEPj () {
}
void _ZNK7android8hardware7camera26params19OutputConfiguration14getSurfaceTypeEv () {
}
void _ZN14CustParameters7mPQCustE () {
}
void _ZNK7android14ICameraService22getInterfaceDescriptorEv () {
  
}

extern "C" {
    void _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(buffer_handle_t, uint32_t, const android::Rect&, void**);
}
