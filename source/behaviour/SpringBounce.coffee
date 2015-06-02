### Spring Bounce Behaviour ###

class SpringBounce extends Behaviour

	constructor: (@v1 = new Vector(), @v2 = new Vector()) ->

		super
	
	apply: (p, dt, index) ->

		#super p, dt, index

		minX = if @v1.x <= @v2.x then @v1.x else @v2.x
		maxX = if @v1.x > @v2.x then @v1.x else @v2.x
		minY = if @v1.y <= @v2.y then @v1.y else @v2.y
		maxY = if @v1.y > @v2.y then @v1.y else @v2.y

		if p.pos.x > minX and p.pos.x < maxX and p.pos.y > minY and p.pos.y < maxY

			v = @v1.x * @v2.y + @v1.y * p.pos.x + @v2.x * p.pos.y - @v2.y * p.pos.x - @v1.x * p.pos.y - @v1.y * @v2.x

			if v > 0 and v < 10000

				p.pos.x += 1
				p.pos.y += 1

			else if v > -10000 and v <= 0

				p.pos.x -= 1
				p.pos.y -= 1