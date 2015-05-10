class EnemyBlob extends Entity
{
  int timer;
  int movespeed;
  
  EnemyBlob(PVector position)
  {
    super(position);
    type = "Enemy.Blob";
    sprite = spriteManager.getSprite(type);
    timer = 0;
    movespeed = 0;
    this.hitbox = new PVector(sprite.width, sprite.height);
  }
  
  void draw()
  {
    super.draw();
    fill(255, 0, 0);
    rect(this.position.x - 15, this.position.y - 15, this.life/2 + 3, 10);  
  }
  
  void update()
  {
    super.update();
    //shitty AI
    timer++;
    timer %= 150;
    if (timer == 0)
    {
      timer = (int)random(75);
      if (velocity.y != 0)
      {
        timer = 0;
      }
      if (velocity.x == 0)
      {
        movespeed = ((int)random(3)-1)*2;
      }
      else
      {
        movespeed = 0;
      }
    }
    velocity.x = movespeed;
  }
  
  boolean collidedWithBlock()
  {
    int i0 = (int)(position.x/blockSize);
    int i1 = (int)((position.x + hitbox.x - 1)/blockSize);
    int j0 = (int)(position.y/blockSize);
    int j1 = (int)((position.y + hitbox.y - 1)/blockSize);
    if (i1 >= blocks.length || j1 >= blocks.length) return true;
    return ((blocks[i0][j0] != null)
         || (blocks[i1][j0] != null)
         || (blocks[i0][j1] != null)
         || (blocks[i1][j1] != null));
  }
  
  void collide(Entity other)
  {
    if (other instanceof EntityPlayer)
    {
      float i = (other.getCenter().x) - (getCenter().x);
      i = i/abs(i == 0 ? 1 : i);
      other.velocity.x = i*8;
      other.velocity.y = -5;
      keyDown = 0;
      other.damage(5);
    }
  }
}
