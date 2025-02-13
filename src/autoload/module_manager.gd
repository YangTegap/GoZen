extends Node

const PATH := "user://module_settings"
const PATH_MODULE := "res://modules/|/%s/|.tscn"


var modules := {
	command_bar = "default",
	editor = "default",
	effects_view = "default",
	files_view = "default",
	file_explorer = "default",
	project_view = "default",
	startup = "default",
	status_bar = "default",
	timeline = "default",
	top_bar = "default",
}


func _ready() -> void:
	if FileAccess.file_exists(PATH):
		_load()
	else:
		_save()


func _save() -> void:
	FileManager.save_data(modules, PATH)


func _load() -> void:
	return
#	var temp_data := str_to_var(FileManager.load_data(PATH))
	# TODO: Check for custom modules and if they still exist or not.
	# We could implement custom modules by loading up the selected custom
	# modules in a dictionary called custom_modules. Inside of this dictionary
	# we have each entry be like this:
	# {key(module name): custom_module_packedscene}
	# Having the custom modules being loaded at startup makes the startup time
	# slower, but the overal speed of the editor will be faster as the custom
	# modules don't need to be loaded first.
#	for key in data:
#		if modules.has(key):
#			modules[key] = data[key]
#		else:
#			print_debug("Key '%s' can not be found in modules!" % key)


func get_module(module: String) -> Node:
	return load(PATH_MODULE.replace('|', module) % modules[module]).instantiate()
