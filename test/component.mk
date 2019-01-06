#
# Main component makefile.
#
# This Makefile can be left empty. By default, it will take the sources in the 
# src/ directory, compile them and link them into lib(subdirectory_name).a 
# in the build directory. This behaviour is entirely configurable,
# please read the ESP-IDF documents if you need to do this.
#

#CFLAGS += -v

COMPONENT_SRCDIRS := ./test ./test/atcacert
COMPONENT_ADD_INCLUDEDIRS += ./ ../

CFLAGS += -DESP32 -DATCA_HAL_I2C -DATCA_PRINTF
#CFLAGS += -DDO_NOT_TEST_CERT 
CFLAGS += -DESP32_DEBUG

#COMPONENT_ADD_INCLUDEDIRS += ./cryptoauthlib/ ./cryptoauthlib/test/
#EXTRA_COMPONENT_DIRS := cryptoauthlib cryptoauthlib_hal
