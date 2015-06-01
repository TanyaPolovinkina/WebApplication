package entityDAO;

import HibernateUtil.HibernateUtil;
import entity.Recipe;
import entity.Recipeingredient;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;

public class RecipeIngredientDAO extends EntityDAO<Recipeingredient> {

    @Override
    public void add(Recipeingredient obj) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(obj);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
    }

    @Override
    public List<Recipeingredient> getAll() {
        Session session = null;
        List client = new ArrayList<Recipeingredient>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            client = session.createCriteria(Recipeingredient.class).list();
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
    public void delete(Recipeingredient obj) {
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
    public void update(Recipeingredient obj) {
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

    public Recipeingredient findEntityById(int id) {
        Session session = null;
        Recipeingredient recipe = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Recipeingredient c where c.recipeIngredientId = :id")
                    .setInteger("id", id);
            recipe = (Recipeingredient) query.uniqueResult();

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

}
