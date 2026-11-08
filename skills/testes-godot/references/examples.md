# GUT
```gdscript
extends GutTest
func test_dash_respeita_cooldown():
	var p = preload("res://player/player.gd").new()
	add_child_autofree(p)
	assert_true(p.try_dash())
	assert_false(p.try_dash(), "segundo dash dentro do cooldown deve falhar")
```
# GdUnit4
```gdscript
extends GdUnitTestSuite
func test_vida_nao_fica_negativa():
	var v = auto_free(Vida.new())
	v.dano(999)
	assert_int(v.atual).is_equal(0)
func test_emite_morreu():
	var v = auto_free(Vida.new())
	monitor_signals(v)
	v.dano(999)
	await assert_signal(v).is_emitted("morreu")
```
