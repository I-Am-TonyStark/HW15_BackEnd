package com.mamalimomen.controllers.servlets;

import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.services.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class SignUpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        try (PrintWriter out = resp.getWriter()) {

            AccountService as = AppManager.getService(Services.ACCOUNT_SERVICE);
            String resultMessage = as.createNewAccount(req);

            resp.setContentType("text/html");

            out.println("<h1>" + resultMessage + "<h1>");
            resp.sendRedirect("login.jsp");
        }
    }
}
