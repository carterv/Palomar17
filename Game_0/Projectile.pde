class Projectile extends Entity
{
  String type;
  PImage sprite;
  float damage;
  
  Projectile(PVector location, PVector velocity, String type, int life, float damage)
  {
    super(location);
    this.velocity = velocity;
    this.type = "Projectile." + type;
    sprite = spriteManager.getSprite("Projectile." + type);
    this.life = life;
    this.damage = damage;
    this.hitbox = new PVector(sprite.width, sprite.height);
  }
  
  void update()
  {
    super.update();
    life--;
    if (life == 0) alive = false;
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