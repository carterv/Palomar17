int blockSize;
SpriteManager spriteManager;
ArrayList<Entity> entities;
Block[][] blocks;
EntityPlayer player;
Table map;

//input variables
boolean jump;
int keyDown;

void setup()
{
  size(1000,600);
  background(0);
  
  blockSize = 20;
  
  map = loadTable("testmap.csv");
  
  spriteManager = new SpriteManager();
  entities = new ArrayList<Entity>();
  blocks = new Block[map.getColumnCount()][map.getRowCount()];
  
  //input variables
  jump = false;
  keyDown = 0;
  
  //for now
  player = new EntityPlayer(new PVector(width/2, height/2));
  entities.add(player);
  fillBlocks();
}

void draw()
{
  background(255);
  
  doInput();
  
  for (Entity e : entities)
  {
    e.draw();
    e.update();
    
    //add entity removal code here
  }
  renderBlocks();
}

void keyPressed()
{
  if (key == 'a' || key == 'A') keyDown = 1;
  else if (key == 'w' || key == 'W') jump = true;
  else if (key == 'd' || key == 'D') keyDown = 2;
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
      if(blocks[i][j] != null)
      {
        blocks[i][j].draw();
      }
    }
  }
}

