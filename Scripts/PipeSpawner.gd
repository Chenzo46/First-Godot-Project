extends Node2D

#Frequencey Variables
@export var spawn_frequencey:float = 2
@export var spawn_frequencey_final:float = 0.75
@export var spawn_frequencey_dwindle:float = 0.015
var sf_temp:float
var t = 0
var lerped_freq = 0
#Pipe prefab
@onready var pipes_prefab:Resource = load("res://Prefabs/pipes.tscn")
@export var pipes_speed = 200
#Random Number gen for y of pipe spawn
var rand_gen = RandomNumberGenerator.new()

func _ready():
	sf_temp = spawn_frequencey
	lerped_freq = spawn_frequencey
	_spawn_pipe()

func _process(delta):
	#Lerp of Time frequencey
	lerped_freq = spawn_frequencey * (1 - t) + spawn_frequencey_final * t
	if t < 1:
		t += delta * spawn_frequencey_dwindle
	#Pipe Spawn Timer
	sf_temp -= delta
	if sf_temp <= 0:
		_spawn_pipe()
		sf_temp = lerped_freq
'''
func _spawn_pipe(): 
	Instantiates pipes prefab from Resource,
	adds it as a child to the root node,
	then places it at the location of the spawners node
	with a random y value between p1 and p2
'''
func _spawn_pipe():
	var pipes_instance = pipes_prefab.instantiate()
	add_child(pipes_instance)
	pipes_instance._set_speed(pipes_speed)
	pipes_instance.position = Vector2(position.x, rand_gen.randf_range($p1.position.y,$p2.position.y))
