# Commands and configuration for loading code. Mostly a passthrough to `west`
# for now.

# JTAG tools
JLINK = JLinkExe
JLINK_GDBSERVER = JLinkGDBServer
JLINK_RTTCLIENT = JLinkRTTClient

# nrfutil tools
MERGEHEX = mergehex
NRFUTIL = nrfutil

# Default port for GDB
GDB_PORT_NUMBER ?= 2331

.PHONY: flash
flash: all
	west flash

.PHONY: serial
serial:
	miniterm.py - 115200 --raw
