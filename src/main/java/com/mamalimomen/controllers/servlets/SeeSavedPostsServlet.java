package com.mamalimomen.controllers.servlets;

import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.services.AccountService;
import com.mamalimomen.services.PostService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class SeeSavedPostsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {
            AccountService as = AppManager.getService(Services.ACCOUNT_SERVICE);
            PostService ps = AppManager.getService(Services.POST_SERVICE);

            String result = "";

            if (!req.getParameter("comment").isEmpty()) {
                result += ps.addExistPostAComment(req);
            }

            if (req.getParameter("like") != null) {
                result += "<br/>" + ps.addExistPostALike(req);
            }

            if (req.getParameter("un_save") != null) {
                result += "<br/>" + as.removeExistActiveAccountASavedPost(req);
            }

            req.setAttribute("result", result);

            String destPage = "see_saved_posts.jsp";
            RequestDispatcher dispatcher = req.getRequestDispatcher(destPage);
            dispatcher.forward(req, resp);
        }
    }
}
