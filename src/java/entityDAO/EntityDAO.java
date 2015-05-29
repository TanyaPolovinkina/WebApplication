package entityDAO;

import java.util.List;

public abstract class EntityDAO<T> {
  
    public abstract void add(T obj);
    public abstract List<T> getAll();
    public abstract void delete(T obj);
    public abstract void update(T obj);
      
}
