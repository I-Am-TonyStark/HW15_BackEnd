package com.mamalimomen.controllers;

import com.mamalimomen.base.controllers.utilities.SMSPanel;
import com.mamalimomen.controllers.utilities.AppManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Date;

public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        AppManager.startApp();

        /*String phoneNumber = sce.getServletContext().getInitParameter("phone");
        SMSPanel sms = new SMSPanel();
        sms.sendSMS("Your Web application was TurnOn at " + new Date(System.currentTimeMillis()), phoneNumber);*/
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AppManager.endApp();

        /*String phoneNumber = sce.getServletContext().getInitParameter("phone");
        SMSPanel sms = new SMSPanel();
        sms.sendSMS("Your Web application was ShutDown at " + new Date(System.currentTimeMillis()), phoneNumber);*/
    }
}
