abstract class Entity
{
  PVector position;
  PVector hitbox;
  PVector velocity;
  PVector acceleration;
  String type;
  PImage sprite;
  boolean alive;

  Entity(PVector position)
  {
    this.position = position;
    this.type = "Entity.Null";
    this.hitbox = new PVector(blockSize, blockSize);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 1);
    this.alive=true;
  }

  void update()
  {
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
    if (this.position.y > 480)
    {
      this.setVelocity(new PVector(0, 0));
    }
  }

  void draw()
  {
    if (sprite != null)
    {
      image(sprite, position.x, position.y);
    }
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

  boolean isAlive()
  {
    return alive;
  }
}

