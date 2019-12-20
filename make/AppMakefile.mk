# application master makefile. Included by application makefiles

# specify `all` as our default rule
all:
# ---- Variables
BASE_DIR = $(realpath ../../)
APP_DIR = $(realpath ./)
ZEPHYR_BASE = $(BASE_DIR)/ncs/zephyr
ZEPHYR_TOOLCHAIN_VARIANT = gnuarmemb
ZEPHYR_CMAKELISTS = CMakeLists.txt
BUILD_DIR = build



# ---- Output filenames


# ---- Include additional supporting makefiles
# Build settings
include $(BASE_DIR)/make/Configuration.mk
include $(BASE_DIR)/make/Includes.mk
include $(BASE_DIR)/make/Program.mk

# Various file inclusions


# ---- Rules for building apps
.PHONY:	all
$(ZEPHYR_CMAKELISTS): Makefile
  $(Q)python3 $(BASE_DIR)/make/zephyr_cmake_gen.py $(PROJECT_NAME) $(APP_SOURCES) --include_dirs $(APP_HEADER_PATHS) > $@

.PHONY: build
build::
cd $(APP_DIR) && west build -b $(BOARD)

.PHONY: clean
clean::
	@echo " Cleaning..."
	$(Q)rm -rf $(BUILD_DIR)


# ---- Dependencies
# Include dependency rules for picking up header changes (by convention at bottom of makefile)
