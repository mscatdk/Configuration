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

## Check SD card

## Unable to write to disk

The following commands will create a file and flush the IO disk cache. The SD card is OK in case the file still exists post the flush.

```bash
# Run as root
echo "Test" > demo.txt
stat demo.txt
sync
echo 3 > /proc/sys/vm/drop_caches
stat demo.txt
```