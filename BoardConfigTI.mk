#
# Copyright (C) 2012 Texas Instruments Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Common Makefile to be included at the bottom of each device's
# BoardConfig.mk file. Definitions here are supposed to be device independent.


# Function to check malformed boolean variable
define ti-check-boolean-var
$(if $(call filter,true,$($(1))),,$(if $($(1)),\
    $(error Boolean variable $(1) is set to "$($(1))". Expected: "true" or undefined),))
endef


# Check boolean variables
$(call ti-check-boolean-var,ENHANCED_DOMX)
$(call ti-check-boolean-var,OMAP_ENHANCEMENT)
$(call ti-check-boolean-var,OMAP_ENHANCEMENT_S3D)
$(call ti-check-boolean-var,OMAP_ENHANCEMENT_CPCAM)
$(call ti-check-boolean-var,OMAP_ENHANCEMENT_VTC)
$(call ti-check-boolean-var,OMAP_ENHANCEMENT_BURST_CAPTURE)
$(call ti-check-boolean-var,USE_ITTIAM_AAC)
$(call ti-check-boolean-var,OMAP_ENHANCEMENT_MULTIGPU)


# Makefile variable and C/C++ macro to recognise DOMX version
ifdef ENHANCED_DOMX
    COMMON_GLOBAL_CFLAGS += -DENHANCED_DOMX
    DOMX_PATH := hardware/ti/domx
else
    DOMX_PATH := hardware/ti/omap4xxx/domx
endif

# C/C++ macros for OMAP_ENHANCEMENT
ifdef OMAP_ENHANCEMENT
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
endif

ifdef OMAP_ENHANCEMENT_BURST_CAPTURE
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_BURST_CAPTURE
endif

ifdef OMAP_ENHANCEMENT_S3D
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_S3D
endif

ifdef OMAP_ENHANCEMENT_CPCAM
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_CPCAM
endif

ifdef OMAP_ENHANCEMENT_VTC
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_VTC
endif

ifdef USE_ITTIAM_AAC
    COMMON_GLOBAL_CFLAGS += -DUSE_ITTIAM_AAC
endif

ifdef OMAP_ENHANCEMENT_MULTIGPU
    COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_MULTIGPU
endif

# Undefine local functions
ti-check-boolean-var :=
