class EntityPlayer extends Entity
{
  Item[][] inventoryItems;
  Item[] equippedItems;
  boolean onGround;
  boolean selected, equip;
  float selectW, selectH;
  int selectedItemIndex, selectedItemIndex2;
  int page;
  PImage border;


  EntityPlayer(PVector position)
  {
    super(position);
    type = "Entity.Player";
    hitbox = new PVector(blockSize, 2*blockSize);
    sprite = spriteManager.getSprite(type + ".Right");
    onGround = true;
    selected = equip = false;
    selectW = 0;
    selectH = 0;
    selectedItemIndex = 0;
    selectedItemIndex2 = 0;
    inventoryItems = new Item[4][8];
    equippedItems = new Item[5];
    page=0;
    PImage border=null;
  }

  void inventory()
  {
    int w = 60;
    int h = 30;
    int row = 0;

    //displays inventory
    image(spriteManager.getSprite("Inventory"), width/5, height/2);
    image(spriteManager.getSprite("Entity.Player", 125), width/2-30, height/5-20);
    image(spriteManager.getSprite("EquipmentSlot"), width/2-35, height/25);
    image(spriteManager.getSprite("EquipmentSlot"), width/2-120, height/5-10);
    image(spriteManager.getSprite("EquipmentSlot"), width/2+50, height/5-10);
    image(spriteManager.getSprite("EquipmentSlot"), width/2-100, height/3);
    image(spriteManager.getSprite("EquipmentSlot"), width/2+30, height/3);
    if (page==0)
    {
      image(spriteManager.getSprite("InventoryTab0"), width/5, height/2+197); //-3
    } else if (page==1)
    {
      image(spriteManager.getSprite("InventoryTab1"), width/5+149, height/2+197); //-4
    } else if (page==2)
    {
      image(spriteManager.getSprite("InventoryTab2"), width/5+299, height/2+197); //-4
    } else
    {
      image(spriteManager.getSprite("InventoryTab3"), width/5+449, height/2+197); //-4
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

    if (equippedItems[0]!=null)
    {
      image(spriteManager.getSprite(equippedItems[0].type, 50), width/2+60, height/5);
    }
    if (equippedItems[1]!=null)
    {
      image(spriteManager.getSprite(equippedItems[1].type, 50), width/2+40, height/3+10);
    }
    if (equippedItems[2]!=null)
    {
      image(spriteManager.getSprite(equippedItems[2].type, 50), width/2-90, height/3+10);
    }
    if (equippedItems[3]!=null)
    {
      image(spriteManager.getSprite(equippedItems[3].type, 50), width/2-110, height/5);
    }
    if (equippedItems[4]!=null)
    {
      image(spriteManager.getSprite(equippedItems[4].type, 50), width/2-25, height/25+10);
    }

    //displays border when selected
    if (selected)
    {
      image(border, selectW, selectH);
    }
  }

  void switchPage()
  {
    if (mouseY>height/2+202 && mouseY<height/2+252)
    {
      if (mouseX>width/5+2 && mouseX<width/5+149)
      {
        page=0;
        selected=false;
      } else if (mouseX>width/5+151 && mouseX<width/5+299)
      {
        page=1;
        selected=false;
      } else if (mouseX>width/5+301 && mouseX<width/5+449)
      {
        page=2;
        selected=false;
      } else if (mouseX>width/5+451 && mouseX<width/5+598)
      {
        page=3;
        selected=false;
      }
    }
  }

  void equipItem(int index)
  {
    Item temp = inventoryItems[page][index];
    if (page==0)
    {
      inventoryItems[page][index]=equippedItems[0];
      equippedItems[0]=temp;
    } else if (page==1)
    {
      if (inventoryItems[page][index].getType().startsWith("Item.Armor.Boots"))
      {
        inventoryItems[page][index]=equippedItems[1];
        equippedItems[1]=temp;
      } else if (inventoryItems[page][index].getType().startsWith("Item.Armor.Legs"))
      {
        inventoryItems[page][index]=equippedItems[2];
        equippedItems[2]=temp;
      } else if (inventoryItems[page][index].getType().startsWith("Item.Armor.Chest"))
      {
        inventoryItems[page][index]=equippedItems[3];
        equippedItems[3]=temp;
      } else if (inventoryItems[page][index].getType().startsWith("Item.Armor.Helmet"))
      {
        inventoryItems[page][index]=equippedItems[4];
        equippedItems[4]=temp;
      }
    }
  }

  void unequip(int index)
  {
    if (equippedItems[index]!=null)
    {
      int slot = emptyInventorySlot(seperateInventory(equippedItems[index]));
      if (slot!=-1)
      {
        addItem(slot, equippedItems[index]);
        equippedItems[index]=null;
      }
    }
  }

  void selectItem(boolean left)
  {
    int w = 60;
    int h = 30;
    int row = 0;

    for (int i=0; i<inventoryItems[page].length; i++)
    {
      if (mouseX>width/5+w-40 && mouseX<width/5+w+85 && mouseY>height/2+h-10 && mouseY<height/2+h+60)
      {
        if (left==true)
        {
          if (!selected)
          {
            selected = true;
            selectW = width/5+w-40;
            selectH = height/2+h-10;
            selectedItemIndex = i;
            border=spriteManager.getSprite("SelectedItem");
          } else if(!equip)
          {
            selectedItemIndex2 = i;
            selected = false;
            switchItems(selectedItemIndex, selectedItemIndex2);
          } else
          {
            selected=equip=false;
            switchEquipment(selectedItemIndex, i);
          }
        } else
        {
          equipItem(i);
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
    for (int i=0; i<equippedItems.length; i++)
    {
      PVector[] coord = {
        new PVector(550, 110), new PVector(530, 200), new PVector(400, 200), new PVector(380, 110), new PVector(465, 24)
        };
        if (mouseX>coord[i].x && mouseX<coord[i].x+70 && mouseY>coord[i].y && mouseY<coord[i].y+70)
        {
          if (left==true)
          {
            if (!selected)
            {
              selected=equip=true; 
              selectW=coord[i].x; 
              selectH=coord[i].y;
              selectedItemIndex = i;
              border=spriteManager.getSprite("SelectedEquipment");
            } else
            {
              selected=equip=false;
              switchEquipment(i, selectedItemIndex);
            }
          } else
          {
            unequip(i);
          }
        }
    }
  }

  int seperateInventory(Item item)
  {
    int tab=3; 
    if (item.getType().startsWith("Item.Weapon"))
    {
      tab=0;
    } else if (item.getType().startsWith("Item.Armor"))
    {
      tab=1;
    } else if (item.getType().startsWith("Item.Potion"))
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

  void switchEquipment(int index, int index2)
  {
    Item temp = inventoryItems[page][index2];
    if (page==0 && index==0)
    {
      inventoryItems[page][index2]=equippedItems[index];
      equippedItems[index]=temp;
    } else if (page==1 && index!=0)
    {
      inventoryItems[page][index2]=equippedItems[index];
      equippedItems[index]=temp;
    }
  }

  int emptyInventorySlot(int i)
  {
    int returnVal = -1; 

    for (int j=0; j<inventoryItems[i].length; j++)
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

  void setSelect(boolean set)
  {
    selected=set;
  }
}

