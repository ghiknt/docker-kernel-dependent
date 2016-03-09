##################################################################
# Include kernel source and config for those privilidged containers
# that need to talk directly to the hardware
# License: AGPL 3.0+
##################################################################
From localhost:5000/whk/base
Maintainer whk <https://whk.name/about/me/>

############################################################
# Install kernel sources since they are required for some packaged (e.g.) docker to build
# And it takes a while to deblob the first time
############################################################
ADD sources.package.use /etc/portage/package.use/sources.use
RUN emerge sys-kernel/hardened-sources

############################################################
# Configure based on an existing config
############################################################
ADD kernel.config /usr/src/linux/.config
RUN (cd /usr/src/linux; make olddefconfig)
