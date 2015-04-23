int blockSize;
SpriteManager spriteManager;
Block[][] blocks;
ArrayList<Entity> entities;
final float MOVESPEED = 3.5;
int keyDown;
boolean inventory;
boolean mousePress;

void setup()
{
  size(1000, 600);
  background(0);

  blockSize = 20;

  spriteManager = new SpriteManager();
  EntityPlayer character = new EntityPlayer(new PVector(width/2, 480));
  entities = new ArrayList<Entity>();
  blocks = new Block[(width/blockSize)+1][height/blockSize];

  //for now 
  entities.add(character);
  fillBlocks();

  EntityItem melee = new EntityItem(new PVector(width*5/7, height/2), "Melee");
  EntityItem ranged = new EntityItem(new PVector(width*3/4, height/2), "Ranged");
  EntityItem melee2 = new EntityItem(new PVector(width*3/5, height/2), "Melee");
  EntityItem ranged2 = new EntityItem(new PVector(width/5, height/2), "Ranged");
  EntityItem melee3 = new EntityItem(new PVector(width*3/2, height/2), "Melee");
  EntityItem ranged3 = new EntityItem(new PVector(width/4, height/2), "Ranged");
  EntityItem melee4 = new EntityItem(new PVector(width/7, height/2), "Melee");
  EntityItem ranged4 = new EntityItem(new PVector(width*3/8, height/2), "Ranged");
  EntityItem melee5 = new EntityItem(new PVector(width/9, height/2), "Melee");
  EntityItem ranged5 = new EntityItem(new PVector(width*3/7, height/2), "Ranged");
  entities.add(melee);
  entities.add(ranged);
  entities.add(melee2);
  entities.add(ranged2);
  entities.add(melee3);
  entities.add(ranged3);
  entities.add(melee4);
  entities.add(ranged4);
  entities.add(melee5);
  entities.add(ranged5);

  inventory=false;
}

void draw()
{
  if (!inventory)
  {
    background(255);

    ArrayList<Entity> removal = new ArrayList<Entity>();
    for (Entity e : entities)
    {
      e.draw();
      e.update();

      if (!e.isAlive())
      {
        removal.add(e);
      }
    }

    for (Entity r : removal)
    {
      entities.remove(r);
    }

    renderBlocks();
  } else
  {
    getPlayer().inventory();
  }
}


//for now
void fillBlocks()
{
  for (int i = 0; i < blocks.length; i++)
  {
    for (int j = 0; j < blocks[i].length; j++)
    {
      if (j > 25)
      {
        blocks[i][j] = new BlockDirt(new PVector((i-1)*blockSize, j*blockSize));
        blocks[i][j].draw();
      }
    }
  }
}

void renderBlocks()
{
  for (int i = 0; i < blocks.length; i++)
  {
    for (int j = 0; j < blocks[i].length; j++)
    {
      if (blocks[i][j] != null)
      {
        blocks[i][j].draw();
      }
    }
  }
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    keyDown = 1;
  } else if (keyCode == LEFT)
  {
    keyDown = 2;
  }

  if (key == 'i')
  {
    inventory = !inventory;
  }
}

void keyReleased()
{
  if (keyCode == RIGHT || keyCode == LEFT)
  {
    if (keyDown == 1 || keyDown == 2)
    {
      keyDown = 0;
    }
  }
}

void mousePressed()
{
  mousePress=true;
}

void mouseReleased()
{
  mousePress=false;
}

void mouseClicked()
{
  if (mouseButton==LEFT)
  {
    getPlayer().selectItem();
  }
}


EntityPlayer getPlayer()
{
  EntityPlayer returnVal=null;
  for (Entity e : entities)
  {
    if (e instanceof EntityPlayer)
    {
      returnVal = (EntityPlayer)e;
    }
  }
  return returnVal;
}

