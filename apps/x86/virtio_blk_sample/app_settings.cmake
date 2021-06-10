#
# Copyright 2019, DornerWorks
#
# SPDX-License-Identifier: BSD-2-Clause
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
