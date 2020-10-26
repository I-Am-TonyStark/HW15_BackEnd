package com.mamalimomen.controllers.servlets;

import com.mamalimomen.base.controllers.utilities.SecurityManager;
import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.domains.Account;
import com.mamalimomen.services.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {

            AccountService as = AppManager.getService(Services.ACCOUNT_SERVICE);
            Optional<Account> oAccount = as.retrieveExistActiveAccount(req);

            Cookie cookie = new Cookie(req.getParameter("username"), req.getParameter("password"));
            cookie.setComment("This cookie stores username and password of your account");
            //cookie.setHttpOnly(true);
            cookie.setMaxAge(365 * 24 * 60 * 60);
            //cookie.setPath("/login");
            resp.addCookie(cookie);

            String destPage = "login.jsp";

            if (oAccount.isEmpty()) {
                String message = "There is not any Account with this username!, try again";
                req.setAttribute("message", message);

            } else {
                Account account = oAccount.get();
                if (SecurityManager.checkPasswordHash(req.getParameter("password"), account.getUser().getPassword())) {
                    HttpSession session = req.getSession();
                    session.setAttribute("account", account);
                    destPage = "home.jsp";
                } else {
                    String message = " Wrong Password";
                    req.setAttribute("message", message);
                }
            }

            RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
            dispatcher.forward(req, resp);
        }
    }
}
