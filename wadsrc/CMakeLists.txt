add_pk3(snapbase.pk3 ${CMAKE_CURRENT_SOURCE_DIR}/static)

generate_language_files(snapbase_pk3 static/language.0
	engine/common)
generate_language_files(snapbase_pk3 static/language.csv
	engine/zdoom)

# insert appstream data into snapbase.pk3, for release notes
add_custom_target(
	copy_metadata
	COMMAND ${CMAKE_COMMAND} -E copy
		"${CMAKE_CURRENT_SOURCE_DIR}/../src/posix/freedesktop/com.doghouse_games.snapgame.metainfo.xml"
		"${CMAKE_CURRENT_SOURCE_DIR}/static/meta.xml"
	COMMAND ${CMAKE_COMMAND} -E copy
		"${CMAKE_CURRENT_SOURCE_DIR}/../CONTRIBUTORS"
		"${CMAKE_CURRENT_SOURCE_DIR}/static/contributors.txt"
)
add_dependencies(snapbase_pk3 copy_metadata)
add_custom_command(
	TARGET snapbase_pk3
	POST_BUILD
	COMMAND ${CMAKE_COMMAND} -E remove
		"${CMAKE_CURRENT_SOURCE_DIR}/static/meta.xml"
	COMMAND ${CMAKE_COMMAND} -E remove
		"${CMAKE_CURRENT_SOURCE_DIR}/static/contributors.txt"
)
