
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://NeutronDriver.h \
    file://NeutronFwllm.elf \
    file://libNeutronDriver.a \
"

do_install:append() {
    install -d ${D}${nonarch_base_libdir}/firmware/
    install -d ${D}${includedir}/neutron/
    install -d ${D}${libdir}/

    install -m 0644 ${WORKDIR}/NeutronFwllm.elf ${D}${nonarch_base_libdir}/firmware/
    install -m 0644 ${WORKDIR}/NeutronDriver.h ${D}${includedir}/neutron/NeutronDriver.h
    install -m 0644 ${WORKDIR}/libNeutronDriver.a ${D}${libdir}/libNeutronDriver.a
}

FILES:${PN} += "${includedir}/neutron/NeutronDriver.h"
FILES:${PN}-dev += "${libdir}/libNeutronDriver.a"
