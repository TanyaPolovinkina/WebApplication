package entityDAO;

import entity.User;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import HibernateUtil.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

public class UserDAO extends EntityDAO<User> {

    public boolean addUser(User obj) {
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
    public void add(User obj) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(obj);
            session.getTransaction().commit();
        } catch (Exception e) {

        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
    }

    @Override
    public List<User> getAll() {
        Session session = null;
        List client = new ArrayList<User>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            client = session.createCriteria(User.class).list();
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
    public void delete(User obj) {
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
    public void update(User obj) {
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

    public User check_client(String log, String pass) {
        Session session = null;
        boolean result = true;
        User user = new User();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from User c where c.login = :log and c.password = :pas ")
                    .setString("log", log).setString("pas", pass);

            user = (User) query.uniqueResult();
            session.getTransaction().commit();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return user;
    }

    public User getUserById(Integer valueOf) {
        Session session = null;
        User client = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            client = (User) session.load(User.class, valueOf);
          client.getFirstname();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка 'findById'", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return client;
    }
}
