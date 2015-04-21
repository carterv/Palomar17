class EntityPlayer extends Entity
{
  boolean onGround;

  EntityPlayer(PVector position)
  {
    super(position);
    this.type = "Entity.Player";
    this.hitbox = new PVector(blockSize, 2*blockSize);
    this.sprite = spriteManager.getSprite(type);
    this.onGround = true;
  }

  void update()
  {
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);

    //Shitty collision detection for now
    if (this.position.y > 480)
    {
      this.setVelocity(new PVector(0, 0));
    }
    if (keyDown == 1)
    {
      this.velocity.set(new PVector(MOVESPEED, this.velocity.y));
    } else if (keyDown == 2)
    {
      this.velocity.set(new PVector(-MOVESPEED, this.velocity.y));
    }
  }

  void inventory()
  {
    if (inventory)
    {
      image(spriteManager.getSprite("Inventory"), width/5, height/2);
    }
  }
}
