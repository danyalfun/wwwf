extends Node2D



func _one_pressed():
	Global.curlevel = 1
	SceneLoader.load_scene("res://game.tscn")
	
