nRF9x Make System
=================

This folder contains the GCC build system for the nRF5x platforms. It
originally comes from
[hlnd/nrf51-pure-gcc-setup](https://github.com/hlnd/nrf51-pure-gcc-setup).

We develop on Linux. Original files still exist for Windows, but have not been
tested in some time. Feel free to submit a pull request if you find something
that doesn't work.

Things to Install
-----------------
1. `gcc-arm-none-eabi`: https://launchpad.net/gcc-arm-embedded
2. gdb-arm-none-eabi
3. The [jlink tools](https://www.segger.com/jlink-software.html) for linux
4. The jlink debuger for linux

Usage
-----

See the `apps/` folder for an example of how to use this build system. An
example Makefile is in the root of this repository.

Additionally, you can customize things inside of your application makefile.
The following variables can all be set:

These are required:
-  BOARD               : specify the board, if you arn't modifying bootloader/softdevice, add ns at end
These are optional

If you want to use the GDB functionality with multiple J-Links, you should
make sure that all projects have a unique GDB port number defined in their
project Makefile.


Targets
-------
Most of the targets provided should be self explanatory, but some may use some
extra explanation:

- `flash`

    Build project and flash onto a chip. 


If you have multiple J-Links connected to your system, you should
set the `SEGGER_SERIAL` variable to the serial number of your J-Link, so that
the programming Just Works (tm). It seems Segger on Linux isn't capable of
giving you a selection of J-Links, as on Windows.


Verbose Output
--------------

To see the full commands that are being run by make, do:

    make V=1


-------

These files are modified from
[hlnd/nrf51-pure-gcc-setup](https://github.com/hlnd/nrf51-pure-gcc-setup) and
are licensed separately from the rest of the repository.
