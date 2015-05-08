class Item extends Entity
{
  Stat stat;
  
  Item(PVector position, String type, Stat stat)
  {
    super(position);
    this.type="Item."+type;
    this.stat = stat;
    hitbox = new PVector(blockSize, blockSize);
    sprite = spriteManager.getSprite(this.type);
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
    if (!(other instanceof EntityPlayer)) return;
    int slot = player.emptyInventorySlot(player.seperateInventory(this));
    if (slot == -1) return;
    player.addItem(slot, this);
    alive = false;
  }
  
  String getType()
  {
    return type;
  }
}

