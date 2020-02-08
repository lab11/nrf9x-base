Nordic nRF9x Support Files
==========================

Starting point and shared code for Nordic nRF9x platforms. Pull requests are
welcome!

Usage
-----

### Submodule

Add this project as a submodule inside of your repo with your nRF9x code.

    git submodule add https://github.com/lab11/nrf9x-base

Then, follow the toolchain setup instructions below.

Include a `Makefile` that looks like this:

    PROJECT_NAME = $(shell basename "$(realpath ./)")

    # Configuration
    BOARD = nrf9160_pca10090ns

    # Source and header files
    APP_HEADER_PATHS += .
    APP_SOURCE_PATHS += .
    APP_SOURCES = $(notdir $(wilecard ./*.c))

    # Include the main Makefile
    BASE_DIR ?= ../..
    include $(BASE_DIR)/make/AppMakefile.mk

Generally, the expected directory structure for your project is:

    /apps
        /<application 1>
        /<application 2>
        ...
    /src
        various platform-level code (e.g. functions shared between applications)
    /include
        various platform-level headers (e.g. platform pin mappings)
    /nrf9x-base (submodule)

### Standalone

Follow the toolchain setup instructions below.

Develop your application code in `/apps/<your_app>`, and include a `Makefile`
identical to the example above.

#### Example

This repo has an example "blinky" application in this style at `/apps/blink`.

Setting up the toolchain
------------------------

The nRF9x boards (e.g. nRF9160) use the [nRF Connect
SDK](https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/getting_started.html),
which involves a significant amount of first-time setup. It can be installed in
a number of ways:

### nRF Connect for Desktop
_(successfully tested on Ubuntu 18.04.4 LTS)_

1. Download and install [nRF Connect for
   Desktop](https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/Download#infotabs)

2. Open nRF Connect after installation. Check for updates by going to
   "Settings" -> "Check for updates now" (instructions last tested with
   v3.0.0).

3. Go to "Add/remove apps" and install the "Getting Started Assistant", "LTE
   Link Monitor", and "Programmer" apps.

4. Launch the "Getting Started Assistant" from the "Launch app" tab (last
   tested with v1.0.1).

5. Complete the "Install the toolchain" section of the Getting Started
   Assistant.

### Mac or Linux
_Do this if you already have an Ubuntu image setup for development, a Mac, or
want to install manually (tested)._

Follow the "Installing the required tools" and "Installing the toolchain"
sections of:

- [nRF Connect SDK steps for installing on Linux](https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/gs_ins_linux.html)
- [nRF Connect SDK steps for installing on macOS](https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/gs_ins_mac.html)

We don't support Windows development directly (although you can find
installation instructions in the nRF Connect SDK documentation). Consider
running an Ubuntu VM and following the directions above.

### All platforms

Finally, after installing the correct toolchain, do the following:

<!--TODO Dynamically set environment variables on every build rather than storing in .bashrc? -->

1. Add the following to your `~/.bashrc` file if not already present (assumes
   `arm-none-eabi` toolchain):

        export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
        export GNUARMEMB_TOOLCHAIN_PATH=<path_to_arm_gcc>
        export ZEPHYR_BASE=<path_to_nrf9x_base>/zephyr

2. Refresh your `bashrc`:

        $ source ~/.bashrc

3. Configure the project, which installs `west` (the meta-utility that manages
   ZephyrOS), downloads required repositories, and installs Python
   requirements, by running the provided script:

        $ sudo ./configure

   If you run into path errors (e.g. `-bash: west: command not found`), check
   that your `$PATH` includes `~/.local/bin`, where Python packages are commonly
   installed on Ubuntu.

Flashing
--------

Program your app, having connected to the target board over USB or JLink.

    make flash

You can use the LTE Link Monitor in the nRF Connect for Desktop app or listen
to output over serial with `miniterm` if it's installed:

    make serial

Additional Reading
------------------

- For cellular applications, read through this
[documentation](https://devzone.nordicsemi.com/nordic/cellular-iot-guides/b/getting-started-cellular/posts/nrf-connect-sdk-tutorial)
to learn how everything works in the background.

- If you're using submodules in your project, you may want to use this to make
  git automatically update them: https://gist.github.com/brghena/fc4483a2df83c47660a5
    
Troubleshooting
---------------

#### CMake and `arm-none-eabi-gcc`

You may need to upgrade to the latest versions of
[CMake](https://cmake.org/download/) and
[gcc-arm-none-eabi](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads).
Make sure to verify your have upgraded using:

    cmake --version
    arm_none_eabi_gcc --version 
    
If the versions are not upgraded, you may need to add the directories to your
PATH as well.

License
-------

The files in this repository are licensed under the MIT License unless
otherwise noted by the local directory's README and license files.

