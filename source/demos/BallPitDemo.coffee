class BallPitDemo extends Demo

    setup: (full = yes) ->

        super full

        min = new Vector 0.0, 0.0
        max = new Vector @width, @height
        
        bounds = new EdgeBounce min, max

        @physics.integrator = new Verlet()

        collide = new Collision()

        max = if full then 400 else 200

        # Add gravity to the simulation.
        gravity = new ConstantForce new Vector 0.0, 300.0

        # Add cursor repulsion
        repulsion = new Attraction @mouse.pos, 200, -1000

        for i in [0..max]

            p = new Particle (Random 0.1, 3.0)
            p.setRadius p.mass * 4

            p.moveTo new Vector (Random @width), (Random @height)

            p.behaviours.push repulsion
            p.behaviours.push gravity
            p.behaviours.push bounds
            p.behaviours.push collide

            collide.pool.push p

            @physics.particles.push p