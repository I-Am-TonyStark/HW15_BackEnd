package com.mamalimomen.services.impl;

import com.mamalimomen.base.services.impl.BaseServiceImpl;
import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.domains.Comment;
import com.mamalimomen.domains.Like;
import com.mamalimomen.domains.Post;
import com.mamalimomen.repositories.PostRepository;
import com.mamalimomen.repositories.impl.PostRepositoryImpl;
import com.mamalimomen.services.CommentService;
import com.mamalimomen.services.LikeService;
import com.mamalimomen.services.PostService;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public class PostServiceImpl extends BaseServiceImpl<Long, Post, PostRepository> implements PostService {
    public PostServiceImpl(EntityManager em) {
        super(new PostRepositoryImpl(em));
    }

    @Override
    public Optional<Post> createNewPost(HttpServletRequest req) {
        Post post = new Post();

        post.setText(req.getParameter("text"));

        post.setImagePath(req.getParameter("img_path"));

        post.setCreateDate(new Date(System.currentTimeMillis()));

        return Optional.of(post);
    }

    @Override
    public List<Post> retrieveAllExistPostsOrderByLike() {
        return repository.findAllPosts();
    }

    @Override
    public String updateExistPost(HttpServletRequest req) {
        /*while (true) {
            try {
                DialogProvider.createAndShowTerminalMessage("%s (old = %s): ", "New Text", post.getText());
                String newText = SingletonScanner.readParagraph();
                if (newText.equalsIgnoreCase("esc")) {
                    break;
                }
                if (!newText.equalsIgnoreCase("pass")) {
                    post.setText(newText);
                }

                DialogProvider.createAndShowTerminalMessage("%s (old = %s): ", "New Image path", post.getImagePath());
                String newImagePath = SingletonScanner.readLine();
                if (!newImagePath.equalsIgnoreCase("pass")) {
                    post.setImagePath(newImagePath);
                }

                if (repository.updateOne(post)) {
                    return "update selected post successfully!";
                } else {
                    return "can not update selected post!";
                }
            } catch (InValidDataException e) {
                DialogProvider.createAndShowTerminalMessage("%s %s%s%n%n", "Wrong entered data format for", e.getMessage(), "!");
            }
        }*/
        return "You Cancelled this operation!";
    }

    @Override
    public String addExistPostALike(HttpServletRequest req) {
        Post post = findOneById(Post.class, Long.parseLong(req.getParameter("id"))).get();

        LikeService ls = AppManager.getService(Services.LIKE_SERVICE);
        Optional<Like> oLike = ls.createNewLike(req);
        if (oLike.isPresent()) {
            post.addLike(oLike.get());
            if (repository.updateOne(post)) {
                return "Like selected post successfully!";
            }
        }
        return "can not Like selected post!";
    }

    @Override
    public String addExistPostAComment(HttpServletRequest req) {
        Post post = findOneById(Post.class, Long.parseLong(req.getParameter("id"))).get();

        CommentService cs = AppManager.getService(Services.COMMENT_SERVICE);
        Optional<Comment> oComment = cs.createNewComment(req);
        if (oComment.isPresent()) {
            post.addComment(oComment.get());
            if (repository.updateOne(post)) {
                return "Comment selected post successfully!";
            }
        }
        return "can not Comment selected post!";
    }
}
