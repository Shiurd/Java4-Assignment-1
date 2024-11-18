package org.example.assignment1.repository;

import org.example.assignment1.entity.Ban;
import org.example.assignment1.utility.HibernateConnection;

import java.util.List;

public class BanDAO {

    public List<Ban> getAllBan() {
        try (var session = HibernateConnection.getFACTORY().openSession()) {
            return session.createQuery("from Ban", Ban.class).getResultList();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void addBan(Ban ban) {
        try (var session = HibernateConnection.getFACTORY().openSession()) {
            session.beginTransaction();
            session.save(ban);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBan(Ban ban) {
        try (var session = HibernateConnection.getFACTORY().openSession()) {
            session.beginTransaction();
            session.update(ban);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteBan(Integer id) {
        try (var session = HibernateConnection.getFACTORY().openSession()) {
            Ban ban = session.get(Ban.class, id);
            session.beginTransaction();
            session.delete(ban);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Ban getBan(int id) {
        try (var session = HibernateConnection.getFACTORY().openSession()) {
            return session.get(Ban.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
