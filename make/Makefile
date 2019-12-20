PROJECT_NAME = $(shell basename "$(realpath ./)")

# Board configuration
# remove ns at the end if the application is accessing secure segment of memory
BOARD = nrf9160_pca10090ns

# Configurations

# Source and header files
APP_HEADER_PATHS += .
APP_SOURCE_PATHS += .
APP_SOURCES = $(notdir $(wildcard ./*.c))

# Include board Makefile (if any)
#include $(NRF_BASE_DIR)/boards/$(BOARD)

# Include main Makefile
BASE_DIR ?= ../..

include $(BASE_DIR)/make/AppMakefile.mk
