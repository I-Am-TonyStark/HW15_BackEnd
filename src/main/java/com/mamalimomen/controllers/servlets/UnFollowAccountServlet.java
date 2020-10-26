package com.mamalimomen.controllers.servlets;

import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.services.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UnFollowAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {
            AccountService as = AppManager.getService(Services.ACCOUNT_SERVICE);

            String result = "";

            if (req.getParameter("unfollow") != null) {

                result += as.removeExistActiveAccountAFollowing(req);
            }

            req.setAttribute("result", result);

            String destPage = "unfollow_account.jsp";
            RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
            dispatcher.include(req, resp);
        }
    }
}
