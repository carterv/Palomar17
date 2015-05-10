class Projectile extends Entity
{
  String type;
  PImage sprite;
  float damage;
  boolean explodes;
  
  Projectile(PVector location, PVector velocity, String type, int life, float damage, boolean explodes)
  {
    super(location);
    this.velocity = velocity;
    this.acceleration = new PVector(0,0);
    this.type = "Projectile." + type;
    sprite = spriteManager.getSprite(this.type);
    this.life = life;
    this.damage = damage;
    this.explodes = explodes;
    this.hitbox = new PVector(sprite.width, sprite.height);
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
          if (explodes) collide(this);
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
  
  void draw()
  {
    if (sprite != null)
    {
      image(sprite, position.x, position.y - sprite.height/2);
    }
  }
  
  boolean collidedWithBlock()
  {
    int i0 = (int)(position.x/blockSize); 
    int i1 = (int)((position.x + hitbox.x)/blockSize); 
    int j0 = (int)(position.y/blockSize); 
    int j1 = (int)((position.y + hitbox.y/2)/blockSize); 
    int j2 = (int)((position.y + hitbox.y - 20)/blockSize); 
    //if (position.x < 0 || position.y < 0 || position.x + hitbox.x >= width || position.y + hitbox.y >= height) return true;
    if (i1 >= blocks.length || j2 >= blocks.length) return true; 
    return ((blocks[i0][j0] != null)
      || (blocks[i1][j0] != null)
      || (blocks[i0][j1] != null)
      || (blocks[i1][j1] != null)
      || (blocks[i0][j2] != null)
      || (blocks[i1][j2] != null));
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
      this.alive = false;
    }
    
    if (explodes)
    {
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
            e.damage(damage*(1/dist));
          }
        }
      }
    }
  }
}
