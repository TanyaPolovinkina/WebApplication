package entityDAO;

import HibernateUtil.HibernateUtil;
import entity.Ingredient;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;


public class IngredientDAO extends EntityDAO<Ingredient>{

     public boolean addIngredient(Ingredient obj) {
        Session session = null;
        boolean result = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(obj);
            session.getTransaction().commit();
        } catch (Exception e) {
            result = false;
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
            return result;
        }
    }
    
     @Override
    public void add(Ingredient obj) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(obj);
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
    }

    @Override
    public List<Ingredient> getAll() {
        Session session = null;
        List ingredient = new ArrayList<Ingredient>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            ingredient = session.createCriteria(Ingredient.class).list();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'getAll'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return ingredient;
    }

    @Override
    public void delete(Ingredient obj) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.delete(obj);
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при удалении", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    @Override
    public void update(Ingredient obj) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.update(obj);
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION
            );
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }

    public Ingredient getElementById(Integer valueOf) {
     Session session = null;
        Ingredient ingredient = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            ingredient = (Ingredient) session.load(Ingredient.class, valueOf);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'findById'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return ingredient;    
    }
    
    public Ingredient getElementByName(String value)
    {
        Session session = null;
        boolean result = true;
        Ingredient ingredient = new Ingredient();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Ingredient c where c.ingredientName = :name")
                    .setString("name", value);

            ingredient = (Ingredient) query.uniqueResult();
            session.getTransaction().commit();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return ingredient;
    }
    
}
