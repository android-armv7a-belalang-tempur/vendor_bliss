# Versioning System For Bliss
# Bliss RELEASE VERSION
BLISS_VERSION_MAJOR = 1
BLISS_VERSION_MINOR = 8
BLISS_VERSION_MAINTENANCE =

VERSION := $(BLISS_VERSION_MAJOR).$(BLISS_VERSION_MINOR)$(BLISS_VERSION_MAINTENANCE)

# Set BLISS_BUILDTYPE
ifdef BLISS_NIGHTLY
    BLISS_BUILDTYPE := NIGHTLY
endif
ifdef BLISS_EXPERIMENTAL
    BLISS_BUILDTYPE := EXPERIMENTAL
endif
ifdef BLISS_RELEASE
    BLISS_BUILDTYPE := RELEASE
endif
# Set GamerMod if no buildtype set (Buildtype should ONLY be set by BLISS Devs!)
ifdef BLISS_BUILDTYPE
else
    BLISS_BUILDTYPE := GamerMod
    BLISS_VERSION_MAJOR := 1
    BLISS_VERSION_MINOR := 8
endif

# Set BLISS version
ifdef BLISS_RELEASE
    BLISS_VERSION := "BlisspopGM-v"$(VERSION) 
else
    BLISS_VERSION := "BlissPopGM-v$(VERSION)-$(BLISS_BUILD)-$(BLISS_BUILDTYPE)"-$(shell date +%Y%m%d-%H%M)
endif

BLISS_DISPLAY_VERSION := $(VERSION)
BLISS_DISPLAY_BUILDTYPE := $(BLISS_BUILDTYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(VERSION) \
    ro.bliss.version=$(VERSION)-$(BLISS_BUILDTYPE)
    
PRODUCT_PROPERTY_OVERRIDES += \
  ro.bliss.display.version=$(BLISS_DISPLAY_VERSION) \
  ro.bliss.display.buildtype=$(BLISS_DISPLAY_BUILDTYPE)
