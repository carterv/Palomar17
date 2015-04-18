abstract class Entity
{
  PVector position;
  PVector hitbox;
  PVector velocity;
  PVector acceleration;
  String type;
  
  Entity(PVector position)
  {
    this.position = position;
    this.type = "Entity.Null";
    this.hitbox = new PVector(blockSize, blockSize);
    this.velocity = new PVector();
    this.acceleration = new PVector(0, 1);
  }
  
  void update()
  {
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
  }
  
  void draw()
  {
    fill(255);
    rect(position.x, position.y, hitbox.x, hitbox.y);
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
  
  String getType()
  {
    return this.type;
  }
}
