abstract class Entity
{
  PVector position;
  PVector hitbox;
  PVector velocity;
  PVector acceleration;
  String type;
  boolean collidable;
  PImage sprite;
  boolean alive;
  int life;
  color dColor;

  Entity(PVector position)
  {
    this.position = position;
    type = "Entity.Null";
    hitbox = new PVector(blockSize, blockSize);
    velocity = new PVector();
    acceleration = new PVector(0, 0.5);
    collidable = true;
    alive = true;
    life = 100;
    dColor = color(255,0,0,0);
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
        float friction = 0.5;
        
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
  }

  void draw()
  {
    if (sprite != null)
    {
      image(sprite, position.x, position.y);
      noStroke();
      fill(dColor);
      rect(position.x,position.y,hitbox.x,hitbox.y);
    }
  }
  
  abstract boolean collidedWithBlock();
  abstract void collide(Entity other);
  
  boolean collidedWithEntity(Entity other)
  {
    float x0 = this.position.x;
    float x1 = other.position.x;
    float y0 = this.position.y;
    float y1 = other.position.y;
    float w0 = this.hitbox.x+x0;
    float w1 = other.hitbox.x+x1;
    float h0 = this.hitbox.y+y0;
    float h1 = other.hitbox.y+y1;
    return (((x1 >= x0 && x1 <= w0) && ((y1 >= y0 && y1 <= h0) || (y1 >= y0 && y1 <= h0)))
         || ((w1 >= x0 && w1 <= w0) && ((y1 >= y0 && y1 <= h0) || (y1 >= y0 && y1 <= h0)))
         || ((x0 >= x1 && x0 <= w1) && ((y0 >= y1 && y0 <= h1) || (y0 >= y1 && y0 <= h1)))
         ||  ((w0 >= x1 && w0 <= w1) && ((y0 >= y1 && y0 <= h1) || (y0 >= y1 && y0 <= h1))));
  }
  
  void damage(float i)
  {
    this.life -= i;
    this.dColor = color(255,0,0,200);
    if (life < 0)
    {
      this.alive = false;
    }
  }
  
  void setSprite(String spriteType)
  {
     this.sprite = spriteManager.getSprite(type + "." + spriteType);
  }

  PVector getVelocity()
  {
    return this.velocity;
  }

  void setVelocity(PVector velocity)
  {
    this.velocity = velocity;
  }

  PVector getPosition()
  {
    return this.position;
  }

  void setPosition(PVector position)
  {
    this.position = position;
  }

  PVector getHitbox()
  {
    return this.hitbox;
  }
  
  PVector getCenter()
  {
    return new PVector(this.position.x+this.hitbox.x/2, this.position.y+this.hitbox.y/2);
  }

  String getType()
  {
    return this.type;
  }

  boolean isAlive()
  {
    return alive;
  }
}

