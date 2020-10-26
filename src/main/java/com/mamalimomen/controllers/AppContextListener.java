package com.mamalimomen.controllers;

import com.mamalimomen.controllers.utilities.AppManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        AppManager.startApp();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AppManager.endApp();
    }
}
