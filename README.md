sourece:https://theboreddev.com/run-ubuntu-on-mac-using-qemu/

## Step 1: Install Ubuntu on macos by QEMU
For the first time
```
qemu-img create -f raw ~/qemu/ubuntu-latest.raw 40G
```
**start machine**
```
qemu-system-aarch64 \
-monitor stdio \
-M virt,highmem=off \
-accel hvf \
-cpu host \
-smp 4 \
-m 3000 \
-bios QEMU_EFI.fd \
-device virtio-gpu-pci \
-display default,show-cursor=on \
-device qemu-xhci \
-device usb-kbd \
-device usb-tablet \
-device intel-hda \
-device hda-duplex \
-drive file=ubuntu-latest.raw,format=raw,if=virtio,cache=writethrough \
-cdrom ubuntu-24.04.2-live-server-arm64.iso
```
<img width="1275" alt="image" src="https://github.com/user-attachments/assets/d432c6a2-ea38-4cfe-8c40-8680f58e393b" />
