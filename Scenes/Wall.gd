extends Area2D

var RGB = 0

func _ready():
	$WallTimer.start()


func setIntensity(col):
	if RGB < col:
		RGB = col
		$Sprite.set_modulate(Color(RGB, RGB, RGB))
		#update()
		$WallTimer.start()

func _on_WallTimer_timeout():
	RGB -= 0.01
	if RGB < 0:
		RGB = 0
	

	$Sprite.set_modulate(Color(RGB, RGB, RGB))
	#update()
	if RGB != 0:
		$WallTimer.start()
