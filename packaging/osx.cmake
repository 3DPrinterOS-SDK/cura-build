find_package(cx_freeze 5.0 REQUIRED)

configure_file(${CMAKE_CURRENT_LIST_DIR}/setup_osx.py.in setup.py @ONLY)
configure_file(${CMAKE_CURRENT_LIST_DIR}/Info.plist.in Info.plist @ONLY)

add_custom_command(
    TARGET packaging POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/build
    COMMAND ${Python3_EXECUTABLE} setup.py bdist_mac
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)

add_custom_command(
    TARGET build_bundle POST_BUILD
    # NOTE: Needs testing here, whether CPACK_SYSTEM_NAME is working good for 64bit builds, too.
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/packaging/cura_license ${CMAKE_BINARY_DIR}/package/
    COMMAND ${CMAKE_COMMAND} -E rename ${CMAKE_BINARY_DIR}/package/cura_license ${CMAKE_BINARY_DIR}/package/LICENSE.txt
    COMMENT "copying cura_license as LICENSE.txt into package/"
	COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/package/plugins/UpdateChecker
	COMMENT "remove UpdateChecker plugin from package/"
)
