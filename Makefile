TARGET_LIB=libopenpixelcontrol.a

INSTALL_DIR=/usr/local
INSTALL_INCLUDE_DIR=include/openpixelcontrol
INSTALL_LIB_DIR=lib

CFLAGS+= -Iinclude

all: lib/$(TARGET_LIB)

clean:
	@rm -rf bin
	@rm -rf obj
	@rm -rf lib

install: lib/libopenpixelcontrol.a
	mkdir -p $(DEST_DIR)$(INSTALL_DIR)/$(INSTALL_INCLUDE_DIR)
	mkdir -p $(DEST_DIR)$(INSTALL_DIR)/$(INSTALL_LIB_DIR)
	@echo "TARGET INSTALL DIRECTORY: [${DEST_DIR}${INSTALL_DIR}]"
	@echo "\tInstalling ${DEST_DIR}${INSTALL_DIR}/$(INSTALL_INCLUDE_DIR)/"
	@cp -v include/openpixelcontrol/* ${DEST_DIR}${INSTALL_DIR}/$(INSTALL_INCLUDE_DIR)
	@echo "\tInstalling ${DEST_DIR}${INSTALL_DIR}/$(INSTALL_LIB_DIR)/libopenpixelcontrol.a"
	@cp -v lib/$(TARGET_LIB) ${DEST_DIR}${INSTALL_DIR}/$(INSTALL_LIB_DIR)/$(TARGET_LIB)

lib/$(TARGET_LIB):
	@mkdir -p lib
	@mkdir -p obj
	${CC} ${CFLAGS} -c -o obj/opc_client.o src/opc_client.c
	${AR} rcs $@ obj/opc_client.o
