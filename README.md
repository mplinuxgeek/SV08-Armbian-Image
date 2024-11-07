# SV08 mainline prebuilt image

This image aims to provide a prebuilt "mainline" solution for the SV08, it has Klipper and all nessecary components to maintain feature parity with the standard firmware image but has some additional nicieites in the way of config tweaks (updated stepper driver config, variable speed fan config, macro changes etc). but the biggest change is I've made Fluidd the default web interface as I find it just that little bit nicer and easier to use, but Mainsail is still there running on port 81.

## Process:

1. **Flashed SD card** with the official Armbian BIGTREETECH CB1 image:
   - [Armbian BIGTREETECH CB1 Image](https://www.armbian.com/bigtreetech-cb1/)
   - **Filename:** `Armbian_24.8.1_Bigtreetech-cb1_bookworm_current_6.6.44_minimal.img.xz`

2. **Installed KIAUH** and the following components:
   - Klipper
   - Moonraker
   - Fluidd (port 80)
   - Mainsail (port 81)
   - KlipperScreen
   - Crowsnest

3. **Setup additional Sovol Addons**:
   - `probe_pressure.py`
   - `z_offset_calibration.py`

4. **Installed Addons**:
   - Moonraker Timelapse
   - G-Code Shell Command

5. **Configuration Changes**:
   - Made updates to `printer.cfg`:
     - Modified fan control settings to reduce noise.
     - Applied the Z stepper configuration from the mainline project repository.
   
   - **Modified Macros**:
     - Fixed mesh leveling to ensure it’s performed at the target bed temperature.
     - Added `CLEAN_NOZZLE` to `START_PRINT` under `BED_MESH_CALIBRATE`.

## To-Do List

- **Software/Plugin Tasks**:
  - Test fixes for eMMC boot.
  
- **Hardware Testing**:
  - Test original LCD.
  
- **Display Adjustments**:
  - Find a solution to rotate HDMI output 180 degrees to align with the original firmware display orientation, ensuring compatibility with existing or printed LCD mounts.

- **Printer-Specific Configurations**:
  - Enable ADXL configuration. 
    - Note: Requires MCU firmware update, so the Katapult bootloader installation is needed.
    - An updated `Klipper.bin` will be installed, but `printer.cfg` will have ADXL support commented out by default. Users can uncomment if their MCU firmware is updated.

NOTE:
This will work sith stock mainboard and toolhead MCU firmware however the current version of Klipper (as of November 7 2024) will throw an error relating to the ADXL config sections so if you haven't updated the MCU firmware then you will need to comment out the [adxl345] and [resonance_tester] sections in printer.cfg and restart Klipper.
