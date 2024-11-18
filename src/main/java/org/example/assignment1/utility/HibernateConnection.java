package org.example.assignment1.utility;

import lombok.Getter;
import org.example.assignment1.entity.Ban;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateConnection {
    @Getter
    private static final SessionFactory FACTORY;

    static {
        Configuration conf = new Configuration();


        Properties properties = new Properties();
        properties.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
        properties.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
        properties.put(Environment.URL, "jdbc:mysql://localhost:3306/assignment_java3_gd2?useSSL=false");
        properties.put(Environment.USER, "root");
        properties.put(Environment.PASS, "123456");
        properties.put(Environment.SHOW_SQL, "true");

        conf.setProperties(properties);

//        conf.addAnnotatedClass(Bia.class);
        conf.addAnnotatedClass(Ban.class);

        ServiceRegistry registry = new StandardServiceRegistryBuilder()
                .applySettings(conf.getProperties()).build();
        FACTORY = conf.buildSessionFactory(registry);

    }

    public static void main(String[] args) {
        System.out.println(getFACTORY());
        System.out.println("Connected");
    }
}
