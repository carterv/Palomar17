abstract class Entity
{
  private PVector position;
  private PVector hitbox;
  private PVector velocity;
  private PVector acceleration;
  
  Entity(PVector position)
  {
    this.position = position;
  }
  
  void update()
  {
    
  }
  
  void draw()
  {
    
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
}
