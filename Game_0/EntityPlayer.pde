class EntityPlayer extends Entity
{
  Item[] inventoryItems;
  boolean onGround;

  EntityPlayer(PVector position)
  {
    super(position);
    this.type = "Entity.Player";
    this.hitbox = new PVector(blockSize, 2*blockSize);
    this.sprite = spriteManager.getSprite(type);
    this.onGround = true;
    inventoryItems = new Item[8];
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
    int w=60;
    int h=30;
    int row=0;
    if (inventory)
    {
      image(spriteManager.getSprite("Inventory"), width/5, height/2);
      for (Item i : inventoryItems)
      {
        if (i!=null)
        {
          image(spriteManager.getSprite(i.type, 50), width/5+w, height/2+h);
        }
        w+=145;
        row++;
        if (row==4)
        {
          w=60;
          h+=90;
        }
      }
    }
  }

  void addItem(int index, Item item)
  {
    inventoryItems[index]=item;
  }

  int emptyInventorySlot()
  {
    int returnVal=-1;

    for (int i=0; i<inventoryItems.length; i++)
    {
      if (inventoryItems[i]==null)
      {
        returnVal=i;
        break;
      }
    }
    return returnVal;
  }
}

