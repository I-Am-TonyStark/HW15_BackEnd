package com.mamalimomen.services;

import com.mamalimomen.base.services.BaseService;
import com.mamalimomen.domains.Post;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

public interface PostService extends BaseService<Long, Post> {
    Optional<Post> createNewPost(HttpServletRequest req);

    List<Post> retrieveAllExistPostsOrderByLike();

    String updateExistPost(HttpServletRequest req);

    String addExistPostALike(HttpServletRequest req);

    String addExistPostAComment(HttpServletRequest req);
}
