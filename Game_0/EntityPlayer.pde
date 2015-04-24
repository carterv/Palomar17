class EntityPlayer extends Entity
{
  Item[] inventoryItems;
  boolean onGround;
  boolean selected;
  int selectW, selectH;
  int selectedItemIndex, selectedItemIndex2;


  EntityPlayer(PVector position)
  {
    super(position);
    this.type = "Entity.Player";
    this.hitbox = new PVector(blockSize, 2*blockSize);
    this.sprite = spriteManager.getSprite(type + ".Right");
    this.onGround = true;
    this.selected = false;
    this.selectW=0;
    this.selectH=0;
    selectedItemIndex=0;
    selectedItemIndex2=0;
    inventoryItems = new Item[8];
  }

  void inventory()
  {
    int w=60;
    int h=30;
    int row=0;

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
    if (selected)
    {
      image(spriteManager.getSprite("SelectedItem"), width/5+selectW-40, height/2+selectH-10);
    }
  }

  void selectItem()
  {
    int w=60;
    int h=30;
    int row=0;

    if (inventory)
    {
      for (int i=0; i<inventoryItems.length; i++)
      {
        if (mouseX>width/5+w-40 && mouseX<width/5+w+85 && mouseY>height/2+h-10 && mouseY<height/2+h+60)
        {
          if (!selected)
          {
            selected=true;
            selectW=w;
            selectH=h;
            selectedItemIndex = i;
          } else
          {
            selectedItemIndex2 = i;
            selected=false;
            switchItems(selectedItemIndex, selectedItemIndex2);
          }
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

  void switchItems(int index, int index2)
  {
    Item temp = inventoryItems[index2];
    inventoryItems[index2]=inventoryItems[index];
    inventoryItems[index]=temp;
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
  
  void update()
  {
    super.update();
    if (keyDown == 1) this.setSprite("Left");
    else if (keyDown == 2) this.setSprite("Right");
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
  
  void collide(Entity other)
  {
  }
}

