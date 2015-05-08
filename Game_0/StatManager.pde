import java.util.HashMap;

class StatManager
{
  HashMap<String,ArrayList<Stat>> stats;
  
  public StatManager(ArrayList<String> statTypes)
  {
    stats = new HashMap<String,ArrayList<Stat>>();
    for (String type : statTypes)
    {
      stats.put(type, new ArrayList<Stat>();
    }
  }
  
  public void update()
  {
    for (ArrayList<Stat> statList : stats.values())
    {
      for (Stat s : stats)
      {
        if (s.duration == 0)
        {
          stats.remove(s);
        }
        else
        {
          s.duration--;
        }
      }
    }
  }
  
  public float getChange(String type)
  {
    float i = 0;
    for (Stat s : stats.get(type))
    {
      i += s.value;
    }
    return i;
  }
  
  public void addStat(String type, Stat s)
  {
    stats.get(type).append(s);
  }
  
  public boolean removeStat(String type, String title)
  {
    boolean flag = false;
    for (String t : stats.keys())
    {
      flag = flag || t.equals(type);
    }
    if (!flag) return flag;
    for (int i = 0; i < stats.get(type).size(); i++)
    {
      if (stats.get(type).get(i).title.equals(title))
      {
        stats.get(type).remove(i));
        return true;
      }
    }
    return false;
  }
}
