  
/*
   Copyright (c) 2021, The LineageOS Project. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fstream>
#include <sstream>
#include <iostream>
#include <string>

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

std::string get_model()
{
    std::ifstream cmdline;
    std::string line, model;

    cmdline.open("/proc/cmdline");

    /*
     * G3311 -> single-sim (SS).
     * G3312 -> dual-sim (DSDS).
     */
    while (getline(cmdline, line)) 
    {
        if (line.find("GinaSS") < line.length()) 
        {
            model = "G3311";
        } 
        else if (line.find("GinaDSDS") < line.length()) 
        {
            model = "G3312";
        }
        else
        {
            ERROR("Could not detect device, forcing G3311");
            model = "G3311";
        }
    }

    cmdline.close();
    return model;
}

void vendor_load_properties()
{
    std::string model = get_model();

    if (model.find("G3311") == 0)
    {
        property_set("persist.radio.multisim.config", "ss");
        property_set("ro.semc.product.model", "G3311");
        property_set("ro.semc.product.name", "Xperia L1");
        property_set("ro.product.model", "G3311");
        property_set("ro.product.name", "pine");
        property_set("ro.product.device", "pine");
    }
    else if (model.find("G3312") == 0)
    {
        property_set("persist.radio.multisim.config", "dsds");
        property_set("ro.semc.product.model", "G3312");
        property_set("ro.semc.product.name", "Xperia L1");
        property_set("ro.product.model", "G3312");
        property_set("ro.product.name", "pine_dsds");
        property_set("ro.product.device", "pine_dsds");
    }

    /* 
     * Build description/fingerprint should be the same for both SS and DSDS.
     */
    property_set("ro.build.description", "pine-user 7.0 2.92.J.7.91_201901172207 1547739479 test-keys");
    property_set("ro.build.fingerprint", "alps/pine/pine:7.0/2.92.J.7.91_201901172207/1547739479:user/test-keys");

    /*
     * We're done here, bail out...
     */
    INFO("Loaded properties for: %s", model.c_str());
}