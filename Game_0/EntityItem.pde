class EntityItem extends Entity
{
  Item item;
  Item[] inventoryItems;
  
  EntityItem(PVector position, String type)
  {
    super(position);
    this.type="Entity.Item."+type;
    this.hitbox = new PVector(blockSize, blockSize);
    this.sprite = spriteManager.getSprite(this.type);
    item = new Item("Attack",1,-1,type);
    inventoryItems = new Item[8];
  }

  void update()
  {
    super.update();
    if ((this.position.x<=getPlayer().getPosition().x+getPlayer().getHitbox().x && this.position.x>=getPlayer().getPosition().x) ||
      (this.position.x+this.hitbox.x<=getPlayer().getPosition().x+getPlayer().getHitbox().x && this.position.x+this.hitbox.x>=getPlayer().getPosition().x))
    {
      if ((this.position.y<=getPlayer().getPosition().y+getPlayer().getHitbox().y && this.position.y>=getPlayer().getPosition().y) ||
        (this.position.y+this.hitbox.y<=getPlayer().getPosition().y+getPlayer().getHitbox().y && this.position.y+this.hitbox.y>=getPlayer().getPosition().y))
      {
        alive=false;
        /*for(int i=0; i<array.size();i++)
        {
          if(a
        inventoryItems*/
      }
    }
  }

  void draw()
  {
    super.draw();
    /*if(this.getType().equals("Entity.Item.Weapon"))
     {
     fill(255,0,0);
     ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
     }
     else if(this.getType().equals("Entity.Item.Armor"))
     {
     fill(0,0,255);
     ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
     }
     else if(this.getType().equals("Entity.Item.Potion"))
     {
     fill(0,255,0);
     ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
     }
     else if(this.getType().equals("Entity.Item.Gold"))
     {
     fill(255,255,0);
     ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
     }
     else
     {
     //error/unkown/misc item
     fill(0,255,255);
     ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
     }*/
  }
}

