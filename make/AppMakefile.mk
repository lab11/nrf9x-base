# application master makefile. Included by application makefiles

# specify `all` as our default rule
all:
# ---- Variables
ZEPHYR_CMAKELISTS = CMakeLists.txt
BUILD_DIR = build



# ---- Include additional supporting makefiles
include $(BASE_DIR)/make/Program.mk
include $(BASE_DIR)/make/Includes.mk

$(ZEPHYR_CMAKELISTS): 
	$(Q)python3 $(BASE_DIR)/make/zephyr_cmake_gen.py $(PROJECT_NAME) "$(APP_SOURCES)" --include_dirs "$(APP_HEADER_PATHS)" > $@

# ---- Rules for building apps
.PHONY: build
build: $(ZEPHYR_CMAKELISTS)
	west build -b $(BOARD)
	rm $(ZEPHYR_CMAKELISTS)

.PHONY: clean
clean::
	@echo " Cleaning..."
	$(Q)rm -rf $(BUILD_DIR)

.PHONY: setup
setup::
	pip3 install --user west
	west init -m https://github.com/NordicPlayground/fw-nrfconnect-nrf
	west update
	cd $(BASE_DIR)/nrf && git checkout $(NCS_TAG) && west update
	pip3 install --user -r zephyr/scripts/requirements.txt
	pip3 install --user -r nrf/scripts/requirements.txt
	pip3 install --user -r mcuboot/scripts/requirements.txt


# ---- Dependencies
# Include dependency rules for picking up header changes (by convention at bottom of makefile)
