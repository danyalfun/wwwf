extends Node2D

@export var playerp:PackedScene

@export var checkpoints:Node2D
var level

func _ready():
	var player = playerp.instantiate()
	
	level = Global.curlevel
	if checkpoints.get_child_count() >= level:
		player.position = checkpoints.get_child(level).position
		print("level: " + str(level))
		
	self.add_child(player)
	
	
	
