package entityDAO;

import HibernateUtil.HibernateUtil;
import entity.StepRecipe;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;

public class StepDAO extends EntityDAO<StepRecipe> {

    @Override
    public void add(StepRecipe obj) {
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

    public StepRecipe findEntity(StepRecipe obj) {
        Session session = null;
        StepRecipe step = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from StepRecipe c where c.stepNumber = :number and c.description = :dscrb ")
                    .setString("dscrb", obj.getDescription())
                    .setInteger("number", obj.getStepNumber());

            step = (StepRecipe) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'add'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return step;
    }

    @Override
    public List<StepRecipe> getAll() {
        Session session = null;
        List client = new ArrayList<StepRecipe>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            client = session.createCriteria(StepRecipe.class).list();
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
    public void delete(StepRecipe obj) {
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
    public void update(StepRecipe obj) {
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

    public StepRecipe findEntityById(int id) {
        Session session = null;
        StepRecipe recipe = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from StepRecipe c where c.stepId = :id")
                    .setInteger("id", id);
            recipe = (StepRecipe) query.uniqueResult();

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
