Nordic nRF9x Support Files
==========================

In Progress - Non-Stable - MakeFile workflow in development
-----------------------------------------------------------

Starting point and shared code for Nordic nRF9x platforms.

Setting up Toolchain
--------------------
Only tested on Ubuntu

1. Download and install nRF Connect for Desktop by going <a href="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/Download#infotabs">here</a>.

2. Open nRF Connect after installation. Check for updates by going to the Settings tab and clicking “Check for updates now.” At the time of writing, the version after updating in the application was v3.0.0.

3. Go to “Add/remove apps” and install the Getting Started Assistant, LTE Link Monitor, and the Programmer apps.

4. Launch the “Getting Started Assistant” from the “Launch app” tab. At the time of writing, the latest version was v1.0.1.

5. Follow all of the steps in the first segment of the Getting Started Assistant: Install the toolchain. The final 3 are only necessary if you don't plan to use the nrf9x-base repo and use SEGGER Embedded Studio.

6. Clone this repo

7. Add the following to your .bashrc file:

        export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
        export GNUARMEMB_TOOLCHAIN_PATH=$HOME/<YOUR_GCC_DIRECTORY>
        export ZEPHYR_BASE=$HOME/<YOUR_NRF9X_BASE_DIRECTORY>/zephyr
<!--TODO Dynamically set environment variables on every build rather than storing in .bashrc-->

8. Refresh your terminal:

        source ~/.bashrc

8. Change directories into the nrf9x\_base repo and run make setup.

        cd <YOUR_NRF9X_BASE_DIRECTORY>

9. Set NCS\_TAG variable in the Makefile located in the root directory to be the latest tag. Refer to instructions in the Makefile.

10. Run the setup

        make setup
        
    The final script is currently volatile and occasionally fails. If it fails with result 
    
        make/AppMakefile.mk:31: recipe for target 'setup' failed
        
    Disregard, the setup has succeeded. 

<!--TODO Perhaps add scripts to setup all the tools -->
Building and flashing an application
------------------------------------
1. Applications are stored in the apps directory. This is where all code related to a specific application lives. To build an application copy the Makefile Example from the make directory into your application directory and make any necessary modifications to it. Then build the application:

        make build

2. To clean the build files use:

        make clean

3. To flash your application:

        make flash

<!--TODO Add flash directions from nrf52x-base README -->

4. To setup a serial connection (You can also use the LTE Link Monitor in the Nrf Connect):

        make serial

Additional Reading
------------------
Read through the following <a href="https://devzone.nordicsemi.com/nordic/cellular-iot-guides/b/getting-started-cellular/posts/nrf-connect-sdk-tutorial">documentation</a> to learn how everything works in the background.
    
Troubleshooting
---------------
If you have any issues building one of the samples you may need to install some tools with pip3. For example:

    pip3 install pyelftools
    
Also, you may need to upgrade to the latest versions of <a href="https://cmake.org/download/">cmake</a> and <a href="https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads">gcc-arm-none-eabi</a>. Make sure to verify your have upgraded using:

    cmake --version
    arm_none_eabi_gcc --version 
    
If the versions are not upgraded, add the directories to your PATH.



