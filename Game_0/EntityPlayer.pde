class EntityPlayer extends Entity
{
  EntityPlayer(PVector position)
  {
    super(position);
    this.type = "Entity.Player";
    this.hitbox = new PVector(blockSize, 2*blockSize);
    this.sprite = spriteManager.getSprite(type + ".Right");
  }
  
  boolean collidedWithBlock()
  {
    int i0 = (int)(position.x/blockSize);
    int i1 = (int)((position.x + hitbox.x - 1)/blockSize);
    int j0 = (int)(position.y/blockSize);
    int j1 = (int)((position.y + hitbox.y/2 - 1)/blockSize);
    int j2 = (int)((position.y + hitbox.y - 1)/blockSize);
    if (position.x < 0 || position.y < 0 || position.x + hitbox.x >= width || position.y + hitbox.y >= height) return true;
    if (i1 >= blocks.length || j2 >= blocks.length) return true;
    return ((blocks[i0][j0] != null)
         || (blocks[i1][j0] != null)
         || (blocks[i0][j1] != null)
         || (blocks[i1][j1] != null)
         || (blocks[i0][j2] != null)
         || (blocks[i1][j2] != null));
  }
  
}
