import java.util.HashMap;

class StatManager
{
  HashMap<String,ArrayList<Stat>> stats;
  
  StatManager(ArrayList<String> statTypes)
  {
    stats = new HashMap<String,ArrayList<Stat>>();
    for (String type : statTypes)
    {
      stats.put(type, new ArrayList<Stat>());
    }
  }
  
  void update()
  {
    for (ArrayList<Stat> statList : stats.values())
    {
      ArrayList<Stat> removables = new ArrayList<Stat>();
      for (Stat s : statList)
      {
        if (s.duration == 0)
        {
          removables.add(s);
        }
        else
        {
          s.duration--;
        }
      }
      for (Stat s : removables)
      {
        statList.remove(s);
      }
    }
  }
  
  float getChange(String type)
  {
    float i = 0;
    for (Stat s : stats.get(type))
    {
      i += s.value;
    }
    return i;
  }
  
  void addStat(Stat s)
  {
    stats.get(s.type).add(s);
  }
  
  boolean removeStat(Stat s)
  {
    boolean flag = false;
    for (String t : stats.keySet())
    {
      flag = flag || t.equals(s.type);
    }
    if (!flag) return flag;
    stats.get(s.type).remove(s);
    return false;
  }
}
