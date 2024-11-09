# SV08 mainline prebuilt image

This image aims to provide a prebuilt "mainline" solution for the SV08, it has Klipper and all nessecary components to maintain feature parity with the standard firmware image but has some additional nicieites in the way of config tweaks (updated stepper driver config, variable speed fan config, macro changes etc). but the biggest change is I've made Fluidd the default web interface as I find it just that little bit nicer and easier to use, but Mainsail is still there running on port 81.

**NOTES:**
- eMMC does work but not with the standard 8GB eMMC, however is working fine on a 32GB eMMC.
- To use this image with stock mainboard and toolhead MCU firmware, be aware that the current Klipper version (as of November 7, 2024) will throw an error with the [adxl345] and [resonance_tester] sections in printer.cfg. If your MCU firmware isn’t updated, comment out these sections and restart Klipper. This will disable input shaper resonance testing, but input shaping will still function with configured values.

It is reccomended to pdate the MCU firmware for full functionality!

# Installation Guide for SV08 Armbian Image

## Prerequisites

- **Image File**: Download `SV08_Armbian_24.8.4_v0.3.img.zip`
- **Compatible Storage Device**: SD card or a 32GB eMMC (8GB models are not supported)
- **USB Adapter**: For writing to eMMC or SD card
- **Software Options**:
  - [balenaEtcher](https://www.balena.io/etcher/) (Cross-platform)
  - [Win32DiskImager](https://sourceforge.net/projects/win32diskimager/) (Windows)

## Step 1: Extract the Image File

1. Download `SV08_Armbian_24.8.4_v0.3.img.zip`.
2. Unzip the file to extract `SV08_Armbian_24.8.4_v0.3.img`. This is the file you’ll write to the storage device.

## Step 2: Prepare the Storage Device

1. Insert the SD card or 32GB eMMC into your computer using the USB adapter.
2. Ensure the device has sufficient storage (8GB models are not supported).

## Step 3: Write the Image Using balenaEtcher

1. Open **balenaEtcher**.
2. Select the extracted `.img` file:
   - Click **Flash from file** and navigate to `SV08_Armbian_24.8.4_v0.3.img`.
3. Choose the target storage device (SD card or eMMC):
   - balenaEtcher will automatically detect compatible devices. Verify the correct device is selected.
4. Click **Flash!** to start the writing process.
5. Once complete, safely remove the storage device from your computer.

## Alternative: Write the Image Using Win32DiskImager (Windows Only)

1. Open **Win32DiskImager**.
2. Select the extracted `.img` file:
   - Click the folder icon and choose `SV08_Armbian_24.8.4_v0.3.img`.
3. Choose the target storage device:
   - Ensure the correct drive letter for your SD card or eMMC is selected.
4. Click **Write** to begin writing the image.
5. Once finished, safely remove the storage device from your computer.

## Troubleshooting

- If you encounter issues, ensure:
  - The eMMC device has at least 32GB capacity.
  - You are using a compatible USB adapter for eMMC.

## Next Steps

With the image successfully written, insert the SD card or eMMC into the SD slot on the printers motherboard and power it on.

