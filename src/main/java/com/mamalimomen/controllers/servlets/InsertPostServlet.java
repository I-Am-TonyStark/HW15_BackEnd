package com.mamalimomen.controllers.servlets;

import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.services.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class InsertPostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {

            AccountService as = AppManager.getService(Services.ACCOUNT_SERVICE);
            String result = as.addExistActiveAccountAPost(req);

            req.setAttribute("result", result);

            String destPage = "home.jsp";
            RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
            dispatcher.forward(req, resp);
        }
    }
}
