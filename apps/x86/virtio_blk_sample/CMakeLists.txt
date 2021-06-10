#
# Copyright 2020, DornerWorks
#
# SPDX-License-Identifier: BSD-2-Clause
#

cmake_minimum_required(VERSION 3.8.2)

project(virtio_blk_sample)

# Include CAmkES VM helper functions
include(${CAMKES_VM_HELPERS_PATH})
find_package(camkes-vm-linux REQUIRED)
include(${CAMKES_VM_LINUX_HELPERS_PATH})

# Declare VM components: Init0
DeclareCAmkESVM(Init0)

# Get 32-bit Linux VM files
GetArchDefaultLinuxKernelFile("32" kernel_file)
GetArchDefaultLinuxRootfsFile("32" rootfs_file)

# Decompress Linux Kernel image
DecompressLinuxKernel(extract_linux_kernel decompressed_kernel ${kernel_file})

# Add Linux VM images into file server
AddToFileServer("bzimage" ${decompressed_kernel} DEPENDS extract_linux_kernel)
AddToFileServer("rootfs.cpio" ${rootfs_file})

DeclareCAmkESVMRootServer(
    virtio_blk_sample.camkes CPP_FLAGS -DLibSatadriversAHCIEnable
)
