# SV08 mainline prebuilt image

This image aims to provide a prebuilt "mainline" solution for the SV08, it has Klipper and all nessecary components to maintain feature parity with the standard firmware image but has some additional nicieites in the way of config tweaks (updated stepper driver config, variable speed fan config, macro changes etc). but the biggest change is I've made Fluidd the default web interface as I find it just that little bit nicer and easier to use, but Mainsail is still there running on port 81.

**NOTES:**
- eMMC does work but not with the standard 8GB eMMC, however is working fine on a 32GB eMMC.
- This will work stock mainboard and toolhead MCU firmware however the current version of Klipper (as of November 7 2024) will throw an error relating to the ADXL config sections so if you haven't updated the MCU firmware then you will need to comment out the [adxl345] and [resonance_tester] sections in printer.cfg and restart Klipper which means you can't do resonance testing without updating the MCU's.


