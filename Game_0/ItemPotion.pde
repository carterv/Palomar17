class ItemPotion extends Item
{
  private String modType;
  private double modVal;
  private double modDur;
  private int stack;
  
  public ItemPotion(PVector position, String type, String modType, double modVal, double modDur)
  {
    super(position,type);
    this.modType=modType;
    this.modVal=modVal;
    this.modDur=modDur;
    stack=1;
  }
  
  public String getModType()
  {
    return modType;
  }
  
  public double getModVal()
  {
    return modVal;
  }
  
  public void setModVal(double modVal)
  {
    this.modVal=modVal;
  }
  
  
  public double getModDur()
  {
    return modDur;
  }
  
  public void setModDur(double modDur)
  {
    this.modDur=modDur;
  }
  
  public int getStack()
  {
    return stack;
  }
  
  public void setStack(int stack)
  {
    this.stack=stack;
  }
}
