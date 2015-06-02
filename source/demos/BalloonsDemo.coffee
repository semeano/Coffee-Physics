### BalloonsDemo ###
class BalloonsDemo extends Demo

	setup: (full = yes) ->

		super

		@physics.integrator = new ImprovedEuler()
		attraction = new Attraction @mouse.pos

		# Add helium to the simulation.
		helium = new ConstantForce new Vector 0.0, -300.0

		# Balloons collisions
		collide = new Collision()

		for i in [0..5]

			p = new Particle (Random 2.0, 4.0)
			p.setRadius p.mass * 8

			p.behaviours.push new Wander 0.2
			p.behaviours.push attraction
			p.behaviours.push helium
			p.behaviours.push collide
			
			p.moveTo new Vector (Random @width), (Random @height)

			collide.pool.push p

			s = new Spring @mouse, p, (Random 100, 200), 1.0

			@physics.particles.push p
			@physics.springs.push s

