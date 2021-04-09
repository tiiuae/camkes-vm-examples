#
# Copyright 2020, DornerWorks
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#
# @TAG(DORNERWORKS_BSD)
#

cmake_minimum_required(VERSION 3.8.2)

project(virtio_blk_sample)

# Include CAmkES VM helper functions
include(${CAMKES_VM_HELPERS_PATH})
find_package(camkes-vm-linux REQUIRED)
include(${CAMKES_VM_LINUX_HELPERS_PATH})

# Declare VM components: Init0
DeclareCAmkESVM(Init0)

# Get Default Linux VM files
GetDefaultLinuxKernelFile(kernel_file)
GetDefaultLinuxRootfsFile(rootfs_file)

# Decompress Linux Kernel image and add to file server
DecompressLinuxKernel(extract_linux_kernel decompressed_kernel ${kernel_file})
AddToFileServer("bzimage" ${decompressed_kernel} DEPENDS extract_linux_kernel)

AddToFileServer("rootfs.cpio" ${rootfs_file})

DeclareCAmkESVMRootServer(virtio_blk_sample.camkes
    CPP_FLAGS -DLibSatadriversAHCIEnable
    )
