cpack_add_component(_cura
            DISPLAY_NAME "DiaPrint PC ${CURA_BUILDTYPE}"
            Description "DiaPrint PC ${CURA_BUILDTYPE} Executable and Data Files"
            REQUIRED
)

# ========================================
# CPack Common Settings
# ========================================

set(CPACK_PACKAGE_NAME "DiaPrint PC")
if(CURA_BUILDTYPE MATCHES "Enterprise")
    set(CPACK_PACKAGE_NAME "DiaPrint PC ${CURA_BUILDTYPE}")
endif()
string(REPLACE " " "_" CPACK_FILE_NAME_NO_SPACES "${CPACK_PACKAGE_NAME}")

set(CPACK_PACKAGE_VENDOR "Ultimaker B.V.")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/Ultimaker/Cura")

# MSI only supports version format like "x.x.x.x" where x is an integer from 0 to 65534
set(CPACK_PACKAGE_VERSION_MAJOR ${CURA_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${CURA_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${CURA_VERSION_PATCH})

# Use full version x.x.x string in install directory of MSI,
#  so that IT can easily automatically upgrade to a newer patch version
set(CURA_FULL_VERSION "${CURA_VERSION_MAJOR}.${CURA_VERSION_MINOR}")
if(CPACK_GENERATOR MATCHES "WIX")
    set(CURA_FULL_VERSION "${CURA_FULL_VERSION}.${CURA_VERSION_PATCH}")
endif()
set(CPACK_PACKAGE_NAME "DiaPrint PC ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")

set(CPACK_PACKAGE_ICON "${CMAKE_SOURCE_DIR}/packaging/cura.ico")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "DiaPrint PC - 3D Printing Software")
set(CPACK_PACKAGE_CONTACT "Ruben Dulek <r.dulek@ultimaker.com>")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/packaging/cura_license.txt")

set(CPACK_CREATE_DESKTOP_LINKS Cura "DiaPrint PC ${CURA_FULL_VERSION}")
set(CPACK_PACKAGE_EXECUTABLES Cura "DiaPrint PC ${CURA_FULL_VERSION}")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "DiaPrint PC ${CURA_FULL_VERSION}")
if(CURA_BUILDTYPE MATCHES "Enterprise")
    set(CPACK_CREATE_DESKTOP_LINKS Cura "DiaPrint PC ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")
    set(CPACK_PACKAGE_EXECUTABLES Cura "DiaPrint PC ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")
    set(CPACK_PACKAGE_INSTALL_DIRECTORY "DiaPrint PC ${CURA_BUILDTYPE} ${CURA_FULL_VERSION}")
endif()

STRING(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" CPACK_SYSTEM_NAME)
set(CPACK_PACKAGE_FILE_NAME "${CPACK_FILE_NAME_NO_SPACES}-${CURA_VERSION_MAJOR}.${CURA_VERSION_MINOR}.${CURA_VERSION_PATCH}-${CPACK_SYSTEM_NAME}")
