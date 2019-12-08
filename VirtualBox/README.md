# Virtual Box

## Resize image

````Bash
# Clone the HD in case the current format is vmdk
VBoxManage.exe clonehd [source image path] [clone image path] --format vdi
# Example: VBoxManage.exe clonehd "source.vmdk" "clone.vdi" --format vdi

# Resize the VDI image
VBoxManage.exe modifyhd [VDI image path] --reize [size in MB]
# Example: VBoxManage.exe modifyhd "clone.vdi" --reize 20240

# Add the resized disk in VirtualBox
````
