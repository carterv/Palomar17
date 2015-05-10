class ProjectileMagic extends Projectile
{
  ProjectileMagic(PVector location, PVector velocity, String type, int life, float damage)
  {
    super(location, velocity, type, life, damage);
  }
  
  void update()
  {
    //get initial velocity and position
    float xVel = velocity.x;
    float yVel = velocity.y;
    PVector start = position.get();
    
    if (collidable)
    {
        //only do collision detection if the entity was moving, so as to avoid doing unnecessary calculations
        if (collidedWithBlock())
        {
          //kill horizontal movement because the entity collided
          collide(this);
          this.alive = false;
        }
        
        //terminal velocity
      if (velocity.y > 10) velocity.y = 10;
    }
    
    position.add(velocity);
    velocity.add(acceleration);
    if (velocity.y > 10) velocity.y = 10;
    
    life--;
    if(life <= 0) alive = false;
  }
  
  void collide(Entity other)
  {
    super.collide(other);
    
    for (Entity e : Game_0.entities)
    {
      if (e.getType().startsWith("Enemy."))
      {
        float dist = sqrt(sq(getCenter().x+hitbox.x/2-e.getCenter().x) + sq(getCenter().y-e.getCenter().y));
        if (dist < 50)
        {
          float i = (other.getCenter().x) - (getCenter().x);
          i = i/abs(i == 0 ? 1 : i);
          e.velocity.x = i*8;
          e.velocity.y = -5;
          e.damage(damage*(1/sq(dist)));
        }
      }
    }
  }
}
