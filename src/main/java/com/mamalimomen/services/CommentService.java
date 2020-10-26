package com.mamalimomen.services;

import com.mamalimomen.base.services.BaseService;
import com.mamalimomen.domains.Comment;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

public interface CommentService extends BaseService<Long, Comment> {
    Optional<Comment> createNewComment(HttpServletRequest req);
}
