extends KinematicBody2D


export (int) var speed
export (int) var maxHealth
export (PackedScene) var soundWave
export (int) var shootVolume
export (int) var hitVolume
var health
var isReloaded = true
var velocity = Vector2()
var isMine


func _ready():
	pass


func _process(delta):
<<<<<<< HEAD
=======
	
>>>>>>> df2e60eec2a6e69138ad521f16f2806dacc34283
	if Input.is_action_pressed("shoot"):
		if isReloaded:
			shoot()
	
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/Start screen.tscn")
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * delta
		move_and_collide(velocity)
	
	rotation = position.angle_to_point(get_viewport().get_mouse_position()) + PI
	
	velocity.x = 0
	velocity.y = 0


func shoot():
	var shootWave = soundWave.instance();
	shootWave.start(position, shootVolume)
	get_parent().add_child(shootWave);
	
	if $BulletRay.is_colliding():
		
		var hitWave = soundWave.instance();
		hitWave.start($BulletRay.get_collision_point(), hitVolume)
		get_parent().add_child(hitWave);
	
	isReloaded = false
	$ReloadTimer.start()


func _on_ReloadTimer_timeout():
	isReloaded = true


func spawn(pos):
	position = pos
	#monitoring = true
	health = maxHealth
	show()
	#monitoring = true



func die():
	call_deferred("set_monitoring", false)
	hide()


