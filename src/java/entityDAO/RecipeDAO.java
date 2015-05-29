package entityDAO;

import HibernateUtil.HibernateUtil;
import entity.Recipe;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;

public class RecipeDAO extends EntityDAO<Recipe> {

    public Recipe findEntity(Recipe obj) {
        Session session = null;
        Recipe recipe = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Recipe c where c.recipeName = :name and c.cookingTime = :time ")
                    .setString("name", obj.getRecipeName())
                    .setInteger("time", obj.getCookingTime());

            recipe = (Recipe) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'add'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return recipe;
    }

    public Recipe findEntityById(int id) {
        Session session = null;
        Recipe recipe = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Recipe c where c.recipeId = :id")
                    .setInteger("id", id);
            recipe = (Recipe) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'add'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return recipe;
    }

    public boolean addRecipe(Recipe obj) {
        Session session = null;
        boolean result = true;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            if (findEntity(obj) != null) {
                result = false;
            } else {
                session.save(obj);
            }
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'add'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return result;
    }

    @Override
    public void add(Recipe obj) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            if (findEntity(obj) != null) {
                session.save(obj);
            }
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'add'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
    }

    @Override
    public List<Recipe> getAll() {
        Session session = null;
        List client = new ArrayList<Recipe>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            client = session.createCriteria(Recipe.class).list();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'getAll'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return client;
    }

    @Override
    public void delete(Recipe obj) {
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
    public void update(Recipe obj) {
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

    public List<Recipe> findEntyties(String name) {
        Session session = null;
        List recipes = new ArrayList<Recipe>();
        String str = "%";
        str += name;
        str += "%";
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            recipes = session.createCriteria(Recipe.class).add(Expression.like("recipeName", str)).list();
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'add'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return recipes;
    }
}
