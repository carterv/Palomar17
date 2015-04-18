class EntityPlayer extends Entity
{
  EntityPlayer(PVector position)
  {
    super(position);
    this.type = "Entity.Player";
    this.hitbox = new PVector(blockSize, 2*blockSize);
  }
}
