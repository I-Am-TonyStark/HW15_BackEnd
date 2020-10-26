package com.mamalimomen.services.impl;

import com.mamalimomen.base.services.impl.BaseServiceImpl;
import com.mamalimomen.domains.Account;
import com.mamalimomen.domains.Comment;
import com.mamalimomen.repositories.CommentRepository;
import com.mamalimomen.repositories.impl.CommentRepositoryImpl;
import com.mamalimomen.services.CommentService;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Optional;

public class CommentServiceImpl extends BaseServiceImpl<Long, Comment, CommentRepository> implements CommentService {
    public CommentServiceImpl(EntityManager em) {
        super(new CommentRepositoryImpl(em));
    }

    @Override
    public Optional<Comment> createNewComment(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");
        Comment comment = new Comment();

        comment.setMessage(req.getParameter("comment"));

        comment.setCreateDate(new Date(System.currentTimeMillis()));

        comment.setWriter(account);

        return Optional.of(comment);
    }
}
