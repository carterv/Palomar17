int blockSize;
SpriteManager spriteManager;
Block[][] blocks;
EntityPlayer player;
Table map;

static ArrayList<Entity> entities;
final float MOVESPEED = 3.5;
boolean inventory;
boolean mousePress;
PVector offset;

//input variables
boolean jump;
int keyDown;

int timer = 0;

void setup()
{
  size(1000, 600);
  background(255);
  cursor(CROSS);

  blockSize = 20;

  map = loadTable("testmap.csv");
  spriteManager = new SpriteManager();
  EntityPlayer character = new EntityPlayer(new PVector(width/2, 480));
  entities = new ArrayList<Entity>();
  blocks = new Block[map.getColumnCount()][map.getRowCount()];
  offset = new PVector(0, 0);

  //input variables
  jump = false;
  keyDown = 0;

  //for now
  player = new EntityPlayer(new PVector(width/2, height/2));
  entities.add(player);
  fillBlocks();

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
      } else
      {
        for (int i = entities.indexOf(e) + 1; i < entities.size(); i++)
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

    renderBlocks();
    
    //scrolling code
    popMatrix();
    
    if(player.alive)
    {
      fill(255, 0, 0);
      rect(40, 30, player.life*2 + 5, 20);
    }

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
    player.inventory();
  }

  doInput();
}

void keyPressed()
{
  if (key == 'a' || key == 'A') keyDown = 1;
  else if (key == 'w' || key == 'W') jump = true;
  else if (key == 'd' || key == 'D') keyDown = 2;
  else if (key == 'i')
  {
    inventory = !inventory;
    player.setSelect(false);
  }
  else if (key == '1') entities.add(new Item(new PVector(mouseX+offset.x, mouseY+offset.y), "Weapon.Melee", 10, new Stat("attack", "+AttackSword", 10, -1)));
  else if (key == '2') entities.add(new Item(new PVector(mouseX+offset.x, mouseY+offset.y), "Weapon.Ranged", 75, new Stat("attack", "+AttackBow", 5, -1)));
  else if (key == '3') entities.add(new Item(new PVector(mouseX+offset.x, mouseY+offset.y), "Consumable.Potion", new Stat("life", "Heal", 1, -1)));
  else if (key == '4') entities.add(new Item(new PVector(mouseX+offset.x, mouseY+offset.y), "Weapon.Staff.Flame", 75, new Stat("magic", "+MagicStaffFlame", 15, -1)));
  else if (key == '5') entities.add(new Item(new PVector(mouseX+offset.x, mouseY+offset.y), "Armor.Boots", new Stat("defense", "+SpeedBoots", 10, -1)));
  else if (key == '6') entities.add(new EnemyBlob(new PVector(mouseX+offset.x, mouseY+offset.y)));
  else key = 0;
}

void keyReleased()
{
  if ((key == 'a' || key == 'A') && keyDown == 1) keyDown = 0;
  else if (key == 'w' || key == 'W') jump = false;
  else if ((key == 'd' || key == 'D') && keyDown == 2) keyDown = 0;
}

void doInput()
{
  if (keyDown == 1) 
  {
    player.setVelocity(new PVector(-3, player.getVelocity().y));
  } else if (keyDown == 2) 
  {
    player.setVelocity(new PVector(3, player.getVelocity().y));
  }

  if (jump)
  {
    //get player position
    int px = (int)(player.getPosition().x/blockSize);
    int py = (int)(player.getPosition().y/blockSize);

    //check if at lower bound or if there is a block under the player
    if (py+2 >= blocks[0].length || blocks[px][py+2] != null) player.setVelocity(new PVector(player.getVelocity().x, -8));
    else if ((px+1)*blockSize+1 < player.getPosition().x+player.getHitbox().x && px+1 < blocks.length && blocks[px+1][py+2] != null) player.setVelocity(new PVector(player.getVelocity().x, -8));
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
  if (mouseButton==LEFT && !inventory && player.equippedItems[0] != null && player.alive)
  {
    entities.add(player.makeProjectile());
  }
}

void mouseReleased()
{
  mousePress=false;
}

void mouseClicked()
{
  if (inventory)
  {
    player.switchPage();
    if (mouseButton==LEFT)
    {
      player.selectItem(true);
    }
    if (mouseButton==RIGHT)
    {
      player.selectItem(false);
    }
  }
}

