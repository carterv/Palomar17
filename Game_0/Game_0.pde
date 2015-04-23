int blockSize;
SpriteManager spriteManager;
Block[][] blocks;
EntityPlayer player;

ArrayList<Entity> entities;
final float MOVESPEED = 3.5;
boolean inventory;
boolean mousePress;

//input variables
boolean jump;
int keyDown;

void setup()
{
  size(1000, 600);
  background(0);

  blockSize = 20;

  spriteManager = new SpriteManager();
  EntityPlayer character = new EntityPlayer(new PVector(width/2, 480));
  entities = new ArrayList<Entity>();
  blocks = new Block[(width/blockSize)+1][height/blockSize];
  
  //input variables
  jump = false;
  keyDown = 0;
  
  //for now
  player = new EntityPlayer(new PVector(width/2, height/2));
  entities.add(player);
  fillBlocks();

  entities.add(new EntityItem(new PVector(width/4, height/2), "Melee"));
  entities.add(new EntityItem(new PVector(width*3/4, height/2), "Ranged"));


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
  
  doInput();
}

void keyPressed()
{
  if (key == 'a' || key == 'A') keyDown = 1;
  else if (key == 'w' || key == 'W') jump = true;
  else if (key == 'd' || key == 'D') keyDown = 2;
  else if (key == 'i') inventory = !inventory;
  else if (key == '1') entities.add(new EntityItem(new PVector(width/4, height/2), "Melee"));
  else if (key == '2') entities.add(new EntityItem(new PVector(width*3/4, height/2), "Ranged"));
}

void keyReleased()
{
  if ((key == 'a' || key == 'A') && keyDown == 1) keyDown = 0;
  else if (key == 'w' || key == 'W') jump = false;
  else if((key == 'd' || key == 'D') && keyDown == 2) keyDown = 0;
}

void doInput()
{
  if (keyDown == 1) 
  {
     player.setVelocity(new PVector(-3, player.getVelocity().y));
     player.setSprite("Left");
  }
  else if (keyDown == 2) 
  {
    player.setVelocity(new PVector(3, player.getVelocity().y));
    player.setSprite("Right");
  }
  
  if (jump)
  {
    //get player position
    int px = (int)(player.getPosition().x/blockSize);
    int py = (int)(player.getPosition().y/blockSize);
    
    //check if at lower bound or if there is a block under the player
    if (py+2 >= blocks[0].length || blocks[px][py+2] != null) player.setVelocity(new PVector(player.getVelocity().x,-7));
    else if ((px+1)*blockSize+1 < player.getPosition().x+player.getHitbox().x && px+1 < blocks.length && blocks[px+1][py+2] != null) player.setVelocity(new PVector(player.getVelocity().x,-7));
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

