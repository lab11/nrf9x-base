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

5. Follow all of the steps in the first 2 segments of the Getting Started Assistant: Install the toolchain and Clone the nRF Connect SDK. The final 2 are only necessary if you plan to use SEGGER Embedded Studio.

6. Add the following to your .bashrc file:

        export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
        export GNUARMEMB_TOOLCHAIN_PATH=$HOME/<YOUR_GCC_DIRECTORY>
        export ZEPHYR_BASE=$HOME/<YOUR_NRF_SOURCE_DIRECTORY>/ncs/zephyr
    
Building and flashing an application
------------------------------------
1. Read through the following <a href="https://devzone.nordicsemi.com/nordic/cellular-iot-guides/b/getting-started-cellular/posts/nrf-connect-sdk-tutorial">documentation</a> to learn how the to build and flash an application.
    
Troubleshooting
---------------
If you have any issues building one of the samples you may need to install some tools with pip3. For example:

    pip3 install pyelftools
    
Also, you may need to upgrade to the latest versions of <a href="https://cmake.org/download/">cmake</a> and <a href="https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads">gcc-arm-none-eabi</a>. Make sure to verify your have upgraded using:

    cmake --version
    arm_none_eabi_gcc --version 
    
If the versions are not upgraded, add the directories to your PATH.

Finally, if you are still having issues it may be that you checked out an older release. Check the <a href="https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/release_notes.html">release notes</a> to find out the corresponding tag of the latest release. 

    git checkout <ncs_tag>
    west update


