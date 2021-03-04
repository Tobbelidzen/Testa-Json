extends Node2D
var json_parse = {}
var json_file
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog = 0
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	json_file = _load()
	print(json_file)
	json_parse = JSON.parse(json_file).result
	print(json_parse["Story1"][1].actor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_node(json_parse["Story1"][i].actor+"/RichTextLabel").text = json_parse["Story1"][i].text
		if i < 1:
			i += 1

func _load():
    var file = File.new()
    file.open("res://test.json", File.READ)
    var content = file.get_as_text()
    print(content)
    file.close()
    return content
