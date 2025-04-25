Step 1: Install Ubuntu on macos by QEMU
For the first time
```
qemu-img create -f raw ~/qemu/ubuntu-latest.raw 40G
```
For the first time
```
qemu % qemu-system-aarch64 \
-monitor stdio \
-M virt, highmem=off \
-accel hvf \
-cpu host
-Smp 4\
-m 3000 \
-bios ~/qemu/QEMU_EFI.fd \
-device virtio-gpu-pci \
-display default, show-cursor=on \
-device qemu-xhci \
-device usb-kbd \
-device usb-tablet \
-device intel-hda \
-device hda-duplex \
-drive file=ubuntu-latest.raw, format=raw, if=virtio, cache=writethrough \
-cdrom ~/Downloads/ubuntu-22.04.3-1ive-server-arm64.iso
```

<img width="601" alt="image" src="https://github.com/user-attachments/assets/f1435437-3b75-4c39-88a9-1f05b25dafc2" />
