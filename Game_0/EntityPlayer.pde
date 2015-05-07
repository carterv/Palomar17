class EntityPlayer extends Entity
{
  Item[][] inventoryItems;
  boolean onGround;
  boolean selected;
  int selectW, selectH;
  int selectedItemIndex, selectedItemIndex2;
  int page;


  EntityPlayer(PVector position)
  {
    super(position);
    type = "Entity.Player";
    hitbox = new PVector(blockSize, 2*blockSize);
    sprite = spriteManager.getSprite(type + ".Right");
    onGround = true;
    selected = false;
    selectW = 0;
    selectH = 0;
    selectedItemIndex = 0;
    selectedItemIndex2 = 0;
    inventoryItems = new Item[4][8];
    page=0;
  }

  void inventory()
  {
    int w = 60;
    int h = 30;
    int row = 0;

    //displays inventory
    image(spriteManager.getSprite("Inventory"), width/5, height/2);
    if(page==0)
    {
      image(spriteManager.getSprite("InventoryTab0"), width/5-3, height/2+197);
    }
    else if(page==1)
    {
      image(spriteManager.getSprite("InventoryTab1"), width/5+146, height/2+197);
    }
    else if(page==2)
    {
      image(spriteManager.getSprite("InventoryTab2"), width/5+296, height/2+197);
    }
    else
    {
      image(spriteManager.getSprite("InventoryTab3"), width/5+446, height/2+197);
    }
    
    //displays inventory items
    for (Item i : inventoryItems[page])
    {
      if (i!=null)
      {
        image(spriteManager.getSprite(i.type, 50), width/5+w, height/2+h);
      }      
      w += 145;
      row++;
      if (row == 4)
      {
        w = 60;
        h += 90;
      }
    }

    //displays border when selected
    if (selected)
    {
      image(spriteManager.getSprite("SelectedItem"), width/5+selectW-40, height/2+selectH-10);
    }
  }
  
  void switchPage()
  {
    if(mouseY>height/2+202 && mouseY<height/2+252)
    {
      if(mouseX>width/5+2 && mouseX<width/5+149)
      {
        page=0;
      }
      else if(mouseX>width/5+151 && mouseX<width/5+299)
      {
        page=1;
      }
      else if(mouseX>width/5+301 && mouseX<width/5+449)
      {
        page=2;
      }
      else if(mouseX>width/5+451 && mouseX<width/5+598)
      {
        page=3;
      }
    }
  }

  void selectItem()
  {
    int w = 60;
    int h = 30;
    int row = 0;

    if (inventory)
    {
      for (int i=0; i<inventoryItems[page].length; i++)
      {
        if (mouseX>width/5+w-40 && mouseX<width/5+w+85 && mouseY>height/2+h-10 && mouseY<height/2+h+60)
        {
          if (!selected)
          {
            selected = true;
            selectW = w;
            selectH = h;
            selectedItemIndex = i;
          }
          else
          {
            selectedItemIndex2 = i;
            selected = false;
            switchItems(selectedItemIndex, selectedItemIndex2);
          }
        }
        w += 145;
        row++;
        if (row == 4)
        {
          w = 60;
          h += 90;
        }
      }
    }
  }
  
  int seperateInventory(Item item)
  {
    int tab=3;
    if (item.getClass()==ItemWeapon.class)
    {
      tab=0;
    }
    else if (item.getClass()==ItemArmor.class)
    {
      tab=1;
    }
    else if (item.getClass()==ItemPotion.class)
    {
      tab=2;
    }
    return tab;
  }
  
  void addItem(int index, Item item)
  {
    if (index >= inventoryItems[seperateInventory(item)].length || index < 0) return;  
    inventoryItems[seperateInventory(item)][index] = item;
  }

  void switchItems(int index, int index2)
  {
    Item temp = inventoryItems[page][index2];
    inventoryItems[page][index2] = inventoryItems[page][index];
    inventoryItems[page][index] = temp;
  }

  int emptyInventorySlot(int i)
  {
    int returnVal = -1;

    for (int j=0; j<inventoryItems[page ].length; j++)
    {
      if (inventoryItems[i][j] == null)
      {
        returnVal = j;
        break;
      }
    }
    return returnVal;
  }

  void update()
  {
    super.update();
    if (keyDown == 1) setSprite("Left");
    else if (keyDown == 2) setSprite("Right");
  }

  boolean collidedWithBlock()
  {
    int i0 = (int)(position.x/blockSize);
    int i1 = (int)((position.x + hitbox.x - 1)/blockSize);
    int j0 = (int)(position.y/blockSize);
    int j1 = (int)((position.y + hitbox.y/2 - 1)/blockSize);
    int j2 = (int)((position.y + hitbox.y - 1)/blockSize);
    //if (position.x < 0 || position.y < 0 || position.x + hitbox.x >= width || position.y + hitbox.y >= height) return true;
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

