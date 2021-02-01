/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lamhdt.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author HL
 */
public class InitEndPoint implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        context.setAttribute("ENDPOINT", "http://localhost:8088/QuizOnline/rest");
        System.out.println("Init EndPoint");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("UnDeploy");
    }
}
