class EntityItem extends Entity
{
  Item item;

  EntityItem(PVector position, String type)
  {
    super(position);
    this.type="Entity.Item."+type;
    this.hitbox = new PVector(blockSize, blockSize);
    this.sprite = spriteManager.getSprite(this.type);
    item = new Item("Null", 0, -1, type);
  }

  void draw()
  {
    super.draw();
  }
  
  boolean collidedWithBlock()
  {
    int i0 = (int)(position.x/blockSize);
    int i1 = (int)((position.x + hitbox.x - 1)/blockSize);
    int j0 = (int)(position.y/blockSize);
    int j1 = (int)((position.y + hitbox.y - 1)/blockSize);
    if (position.x < 0 || position.y < 0 || position.x + hitbox.x >= width || position.y + hitbox.y >= height) return true;
    if (i1 >= blocks.length || j1 >= blocks.length) return true;
    return ((blocks[i0][j0] != null)
         || (blocks[i1][j0] != null)
         || (blocks[i0][j1] != null)
         || (blocks[i1][j1] != null));
  }
  
  void collide(Entity other)
  {
    if (!(other instanceof EntityPlayer)) return;
    int slot = player.emptyInventorySlot();
    if (slot == -1) return;
    player.addItem(slot, item);
    alive = false;
  }
}

