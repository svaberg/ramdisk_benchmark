#!/bin/bash
# The standard form of the mount command, is mount -t type device dir
# This tells the kernel to attach the filesystem found on device (which is of type  type)  at
# the directory dir.  The previous contents (if any) and owner and mode of dir become invisi‐
# ble, and as long as this filesystem remains mounted, the pathname dir refers to the root of
# the filesystem on device.

VSFTYPE="tmpfs"
OPTIONS="size=700M"
DEVICE="test_ramdisk"
DIRECTORY="/tmp/test/ramdisk/"

if [ ! -d "$DIRECTORY" ]; then
  
  # Control will enter here if $DIRECTORY exists.
  mkdir --parents --mode=777 ${DIRECTORY}
  sudo mount -t ${VSFTYPE} -o ${OPTIONS} ${DEVICE} ${DIRECTORY}
  echo "RAM disk ${OPTIONS} mounted in ${DIRECTORY}."
else
  echo "ERROR: Folder ${DIRECTORY} already exists!"
fi

