# Raspberry Pi

## Disable Hardware
### HDMI
Disable
```bash
/opt/vc/bin/tvservice -o
```
Enable
```bash
/opt/vc/bin/tvservice -p
```
### USB
Disable:
```bash
echo 0x0 > /sys/devices/platform/soc/3f980000.usb/buspower
```
Enable:
```bash
echo 0x1 > /sys/devices/platform/soc/3f980000.usb/buspower
```
