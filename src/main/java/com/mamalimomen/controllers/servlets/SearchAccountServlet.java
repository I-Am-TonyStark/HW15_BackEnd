package com.mamalimomen.controllers.servlets;

import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.domains.Account;
import com.mamalimomen.services.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

public class SearchAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {
            if (req.getParameter("follow") != null) {

                AccountService as = AppManager.getService(Services.ACCOUNT_SERVICE);
                String message = as.addExistActiveAccountAFollowing(req);

                req.setAttribute("message", message);
            }

            req.getSession().removeAttribute("searched_account");

            String destPage = "search_account.jsp";
            RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {

            AccountService as = AppManager.getService(Services.ACCOUNT_SERVICE);
            Optional<Account> oAccount = as.retrieveExistActiveAccount(req);

            String destPage = "search_account.jsp";

            if (oAccount.isEmpty()) {
                String message = "There is not any Account with this username!";
                req.setAttribute("message", message);

            } else {
                Account account = oAccount.get();
                req.getSession().setAttribute("searched_account", account);
            }

            RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
            dispatcher.forward(req, resp);
        }
    }
}
