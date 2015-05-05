int blockSize;
SpriteManager spriteManager;
Block[][] blocks;
EntityPlayer player;
Table map;

ArrayList<Entity> entities;
ArrayList<Projectile> projectiles;
final float MOVESPEED = 3.5;
boolean inventory;
boolean mousePress;
PVector offset;

//input variables
boolean jump;
int keyDown;

void setup()
{
  size(1000, 600);
  background(0);
  cursor(CROSS);

  blockSize = 20;

  map = loadTable("testmap.csv");
  spriteManager = new SpriteManager();
  EntityPlayer character = new EntityPlayer(new PVector(width/2, 480));
  entities = new ArrayList<Entity>();
  projectiles = new ArrayList<Projectile>();
  blocks = new Block[map.getColumnCount()][map.getRowCount()];
  offset = new PVector(0,0);
  
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
    
    pushMatrix();
    translate(-offset.x, -offset.y);
    
    ArrayList<Entity> removal = new ArrayList<Entity>();
    for (Entity e : entities)
    {
      e.draw();
      e.update();

      if (!e.isAlive())
      {
        removal.add(e);
      }
      else
      {
        int i = entities.indexOf(e) + 1;
        for (; i < entities.size(); i++)
        {
          Entity e1 = entities.get(i);
          if (e.collidedWithEntity(e1) && e1.isAlive())
          {
            e.collide(e1);
            e1.collide(e);
          }
        }
      }
    }
    
    for (Entity r : removal)
    {
      entities.remove(r);
    }
    
    ArrayList<Projectile> pRemove = new ArrayList<Projectile>();
    for (Projectile p : projectiles)
    { 
      p.draw();
      p.update();
      if (p.life <= 0)
      {
        pRemove.add(p);
      }
    }
    for (Projectile r : pRemove)
    {
      projectiles.remove(r);
    }
    
    renderBlocks();
    
    popMatrix();
    
    int realX = (int)(player.position.x - offset.x);
    int realY = (int)(player.position.y - offset.y);
    
    int o = 0;
    
    if (realX < width/3) o = width/3 - realX;
    else if (realX > 2*width/3) o = 2*width/3 - realX;
    
    if (o > 10) offset.x -= 10;
    else if (o < -10) offset.x -= -10;
    else offset.x -= o;
    
    if (offset.x < 0) offset.x = 0;
    else if (offset.x > blocks.length*blockSize - width) offset.x = blocks.length*blockSize - width;
    
    o = 0;
    
    if (realY < height/3) o = height/3 - realY;
    else if (realY > 2*height/3) o = 2*height/3 - realY;
    
    if (o > 10) offset.y -= 10;
    else if (o < -10) offset.y -= -10;
    else offset.y -= o;
    
    if (offset.y < 0) offset.y = 0;
    else if (offset.y > blocks[0].length*blockSize - height) offset.y = blocks[0].length*blockSize - height;
    
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
  }
  else if (keyDown == 2) 
  {
    player.setVelocity(new PVector(3, player.getVelocity().y));
  }
  
  if (jump)
  {
    //get player position
    int px = (int)(player.getPosition().x/blockSize);
    int py = (int)(player.getPosition().y/blockSize);
    
    //check if at lower bound or if there is a block under the player
    if (py+2 >= blocks[0].length || blocks[px][py+2] != null) player.setVelocity(new PVector(player.getVelocity().x,-8));
    else if ((px+1)*blockSize+1 < player.getPosition().x+player.getHitbox().x && px+1 < blocks.length && blocks[px+1][py+2] != null) player.setVelocity(new PVector(player.getVelocity().x,-8));
  }
}

//for now
void fillBlocks()
{
  for (int i = 0; i < blocks.length; i++)
  {
    for (int j = 0; j < blocks[i].length; j++)
    {
      int blockID = map.getInt(j, i);
      if (blockID != 0)
      {
        blocks[i][j] = new Block(new PVector(i*blockSize, j*blockSize), blockID);
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
  if (mouseButton==LEFT)
  {
    PVector projectileVector = new PVector(mouseX - player.position.x + offset.x, mouseY - player.position.y + offset.y);
    projectileVector.normalize();
    PVector position = PVector.add(PVector.mult(projectileVector, blockSize), player.position);
    projectiles.add(new Projectile(position, PVector.mult(projectileVector, 6), "Sword", 5));
  }
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

