class Projectile
{
  PVector start;
  PVector position;
  PVector velocity;
  String type;
  double distance;
  PImage sprite;
  double life;  
  
  Projectile(PVector position, PVector velocity, String type, double life)
  {
    this.start = position;
    this.position = position;
    this.velocity = velocity;
    this.distance = distance;
    this.type = "Projectile." + type;
    sprite = spriteManager.getSprite("Projectile." + type);
    this.life = life;
  }
  
  void update()
  {
    position.add(velocity);
    life--;
  }
  
  void draw()
  {
    if (sprite != null)
    {
      image(sprite, position.x, position.y);
    }
  }
}
