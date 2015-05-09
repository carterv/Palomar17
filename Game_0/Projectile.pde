class Projectile extends Entity
{
  String type;
  PImage sprite;
  float damage;
  
  Projectile(PVector location, PVector velocity, String type, int life, float damage)
  {
    super(location);
    this.velocity = velocity;
    this.acceleration = new PVector(0,0);
    this.type = "Projectile." + type;
    sprite = spriteManager.getSprite(this.type);
    this.life = life;
    this.damage = damage;
    this.hitbox = new PVector(sprite.width, sprite.height);
  }
  
  void update()
  {
    //TODO: implement life/isAlive. Code should go at the start of update()
    
    
    //get initial velocity and position
    float xVel = velocity.x;
    float yVel = velocity.y;
    PVector start = position.get();
    
    if (collidable)
    {
      // if the entity has not collided with a block, do movement
      if (!collidedWithBlock())
      {
        //try horizontal movement
        position.x += xVel;
        
        //only do collision detection if the entity was moving, so as to avoid doing unnecessary calculations
        if (collidedWithBlock() && xVel != 0)
        {
          //get horizontal direction
          xVel = xVel/abs(xVel);
          
          //reverse direction while the entity is collided, only up to the initial position
          while (collidedWithBlock() && position.x != start.x)
          {
            position.x -= xVel;
          }
          
          //kill horizontal movement because the entity collided
          velocity.x = 0;
        }
        
        //try vertical movement
        float friction = 0.0;
        
        //only move if velocity is above a threshold
        if (abs(yVel) >= 1) position.y += yVel;
        
        //only do collision detection if the entity was moving, same reason as above
        if (collidedWithBlock() && yVel != 0)
        {
          //get vertical direction
          yVel = yVel/abs(yVel);
          
          //reverse direction while the entity is collided, only up to the initial position
          while (collidedWithBlock() && position.y != start.y)
          {
            position.y -= yVel;
          }
          
          //TODO: implement fall damage, code goes here
          
          //kill vertical movement because the entity collided
          velocity.y = 0;
        }
        
        //add friction
        if (velocity.x > 0) velocity.x = (velocity.x - friction > 0) ? velocity.x - friction : 0;
        else if (velocity.x < 0) velocity.x = (velocity.x + friction < 0) ? velocity.x + friction : 0;
        
        //add gravity
        velocity.add(acceleration);
        
        //terminal velocity
        if (velocity.y > 10) velocity.y = 10;
      }
      else //if inside block before movement is applied
      {
        int i = 1;
        while (collidedWithBlock())
        {
          //vertical movement attempt
          position.y -= i;
          if (!collidedWithBlock()) break;
          position.y = start.y;
          
          //horizontal movement attempts
          position.x -= i;
          if (!collidedWithBlock()) break;
          position.x = start.x + i;
          if (!collidedWithBlock()) break;
          position.x = start.x;
          
          //increment distance search
          i++;
        }
      }
    }
    else
    {
      position.add(velocity);
      velocity.add(acceleration);
      if (velocity.y > 10) velocity.y = 10;
    }
    if (alpha(dColor) > 0)
    {
      int a = (int)(alpha(dColor)-15 < 1 ? 0 : alpha(dColor)-15);
      dColor = color(255,0,0,a);
    }
    
    life--;
    if(life <= 0){alive = false;}
  }
  
  void draw()
  {
    if (sprite != null)
    {
      image(sprite, position.x, position.y);
    }
  }
  
  boolean collidedWithBlock()
  {
    return false;
  }
  
  void collide(Entity other)
  {
    if (other.getType().startsWith("Enemy."))
    {
      float i = (other.getCenter().x) - (getCenter().x);
      i = i/abs(i == 0 ? 1 : i);
      other.velocity.x = i*8;
      other.velocity.y = -5;
      other.damage(damage);
    }
  }
}
