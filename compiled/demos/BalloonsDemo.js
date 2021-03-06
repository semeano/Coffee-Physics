// Generated by CoffeeScript 1.9.1

/* BalloonsDemo */
var BalloonsDemo,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

BalloonsDemo = (function(superClass) {
  extend(BalloonsDemo, superClass);

  function BalloonsDemo() {
    return BalloonsDemo.__super__.constructor.apply(this, arguments);
  }

  BalloonsDemo.prototype.setup = function(full) {
    var attraction, collide, helium, i, j, p, results, s;
    if (full == null) {
      full = true;
    }
    BalloonsDemo.__super__.setup.apply(this, arguments);
    this.physics.integrator = new ImprovedEuler();
    attraction = new Attraction(this.mouse.pos);
    helium = new ConstantForce(new Vector(0.0, -300.0));
    collide = new Collision();
    results = [];
    for (i = j = 0; j <= 5; i = ++j) {
      p = new Particle(Random(2.0, 4.0));
      p.setRadius(p.mass * 8);
      p.behaviours.push(new Wander(0.2));
      p.behaviours.push(attraction);
      p.behaviours.push(helium);
      p.behaviours.push(collide);
      p.moveTo(new Vector(Random(this.width), Random(this.height)));
      collide.pool.push(p);
      s = new Spring(this.mouse, p, Random(100, 200), 1.0);
      this.physics.particles.push(p);
      results.push(this.physics.springs.push(s));
    }
    return results;
  };

  return BalloonsDemo;

})(Demo);
