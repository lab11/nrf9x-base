# Application master makefile. Included by application makefiles

# specify `all` as our default rule
all:

# ---- Variables
ZEPHYR_CMAKELISTS = CMakeLists.txt
BUILD_DIR = build

# ---- Include additional supporting makefiles
include $(BASE_DIR)/make/Program.mk
include $(BASE_DIR)/make/Includes.mk

# Convert simple Makefile for Zephyr CMake build system
$(ZEPHYR_CMAKELISTS): 
	$(Q)python3 $(BASE_DIR)/make/zephyr_cmake_gen.py $(PROJECT_NAME) "$(APP_SOURCES)" --include_dirs "$(APP_HEADER_PATHS)" > $@

# ---- Rules for building apps
.PHONY: all
all: $(ZEPHYR_CMAKELISTS)
	west build -b $(BOARD)

.PHONY: clean
clean:
	@echo " Cleaning..."
	$(Q)rm -rf $(BUILD_DIR)
	rm $(ZEPHYR_CMAKELISTS)

# ---- Dependencies
# Include dependency rules for picking up header changes (by convention at bottom of makefile)

