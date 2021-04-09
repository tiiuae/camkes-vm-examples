#
# Copyright 2019, DornerWorks
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#
# @TAG(DORNERWORKS_BSD)
#

cmake_minimum_required(VERSION 3.8.2)

# Define kernel config options
set(KernelSel4Arch x86_64 CACHE STRING "" FORCE)

set(KernelMaxNumNodes 4 CACHE STRING "" FORCE)
set(KernelHugePage OFF CACHE BOOL "" FORCE)

ApplyCommonSimulationSettings(${KernelArch})
set(KernelIOMMU ON CACHE BOOL "" FORCE)

# Enable sataserver
set(LibSatadrivers ON CACHE BOOL "" FORCE)

set(CAmkESVMDestHardware "optiplex" CACHE STRING "" FORCE)
