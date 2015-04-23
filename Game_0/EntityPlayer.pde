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
    this.sprite = spriteManager.getSprite(type);
    this.onGround = true;
    this.selected = false;
    this.selectW=0;
    this.selectH=0;
    selectedItemIndex=0;
    selectedItemIndex2=0;
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
}

