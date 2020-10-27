package com.mamalimomen.services.impl;

import com.mamalimomen.base.controllers.utilities.InValidDataException;
import com.mamalimomen.base.controllers.utilities.SecurityManager;
import com.mamalimomen.base.services.impl.BaseServiceImpl;
import com.mamalimomen.controllers.utilities.AppManager;
import com.mamalimomen.controllers.utilities.Services;
import com.mamalimomen.domains.Account;
import com.mamalimomen.domains.Post;
import com.mamalimomen.domains.User;

import com.mamalimomen.repositories.AccountRepository;
import com.mamalimomen.repositories.impl.AccountRepositoryImpl;
import com.mamalimomen.services.AccountService;
import com.mamalimomen.services.PostService;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class AccountServiceImpl extends BaseServiceImpl<Long, Account, AccountRepository> implements AccountService {
    public AccountServiceImpl(EntityManager em) {
        super(new AccountRepositoryImpl(em));
    }

    @Override
    public String createNewAccount(HttpServletRequest req) {
        User user = new User();

        try {
            user.setFirstName(req.getParameter("first_name"));
            user.setLastName(req.getParameter("last_name"));
            user.setAboutMe(req.getParameter("about_me"));
            user.setPassword(req.getParameter("password"));
            user.setUsername(req.getParameter("username"));

            Account account = new Account();
            account.setUser(user);

            if (repository.saveOne(account)) {
                return "Your Account was created successfully!";
            } else return "This Username has taken already!";
        } catch (InValidDataException e) {
            return "Wrong entered data format for " + e.getMessage() + "!";
        }
    }

    @Override
    public Optional<Account> retrieveExistActiveAccount(HttpServletRequest req) {
        return repository.findOneActiveAccountByUsername(req.getParameter("username"));
    }

    @Override
    public String updateExistActiveAccountPassword(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");
        try {
            if (!SecurityManager.checkPasswordHash(req.getParameter("old_password"), account.getUser().getPassword())) {
                return "Wrong Password!";
            }

            account.getUser().setPassword(req.getParameter("new_password"));

            if (repository.updateOne(account)) {
                return "account's password changes successfully!";
            } else {
                return "can not change account's password!";
            }
        } catch (InValidDataException e) {
            return "Wrong entered data format for " + e.getMessage() + "!";
        }
    }

    @Override
    public String updateExistActiveAccountInformation(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");
        User user = account.getUser();

        try {
            String newFirstName = req.getParameter("new_first_name");
            String newLastName = req.getParameter("new_last_name");
            String newAboutMe = req.getParameter("new_about_me");

            if (!newFirstName.isEmpty())
                user.setFirstName(newFirstName);

            if (!newLastName.isEmpty())
                user.setLastName(newLastName);

            if (!newAboutMe.isEmpty())
                user.setAboutMe(newAboutMe);

            if (repository.updateOne(account)) {
                return "account's information changes successfully!";
            } else {
                return "can not change account's information!";
            }
        } catch (InValidDataException e) {
            return "Wrong entered data format for " + e.getMessage() + "!";
        }
    }

    @Override
    public String addExistActiveAccountAPost(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");

        PostService postService = AppManager.getService(Services.POST_SERVICE);
        Optional<Post> oPost = postService.createNewPost(req);

        account.addPost(oPost.get());
        if (repository.updateOne(account)) {
            return "create new post and update your account successfully!";
        } else {
            return "can not create new post or update your account!";
        }
    }

    @Override
    public String addExistActiveAccountASavedPost(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");

        PostService ps = AppManager.getService(Services.POST_SERVICE);
        Post post = ps.findOneById(Post.class, Long.parseLong(req.getParameter("id"))).get();

        account.addSavedPost(post);
        if (repository.updateOne(account)) {
            return "save choose post and update your account successfully!";
        } else {
            account.getSavedPosts().remove(post);
            return "can not save choose post or update your account!";
        }
    }

    @Override
    public String removeExistActiveAccountAPost(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");

        List<Post> posts = account.getPosts();
        posts.remove(posts.get(Integer.parseInt(req.getParameter("index"))));
        account.setPosts(posts);

        if (repository.updateOne(account)) {
            return "delete selected post and update your account successfully!";
        } else {
            return "can not delete selected post or update your account!";
        }
    }

    @Override
    public String removeExistActiveAccountASavedPost(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");

        List<Post> posts = account.getSavedPosts();
        posts.remove(posts.get(Integer.parseInt(req.getParameter("index"))));
        account.setSavedPosts(posts);

        if (repository.updateOne(account)) {
            return "delete selected saved post and update your account successfully!";
        } else {
            return "can not delete selected saved post or update your account!";
        }
    }

    @Override
    public String addExistActiveAccountAFollowing(HttpServletRequest req) {
        Account follower = (Account) req.getSession().getAttribute("account");
        Account following = (Account) req.getSession().getAttribute("searched_account");
        if (following.equals(follower)) {
            return "You can not follow yourself!";
        } else {
            follower.addFollowing(following);
            if (repository.updateOne(follower)) {
                return "follow selected account and update your account successfully!";
            } else {
                follower.getFollowings().remove(following);
                following.getFollowers().remove(follower);
                return "can not follow selected account or update your account!";
            }
        }
    }

    @Override
    public String removeExistActiveAccountAFollowing(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");

        List<Account> followings = account.getFollowings();
        Account chooseAccount = followings.get(Integer.parseInt(req.getParameter("index")));
        followings.remove(chooseAccount);
        chooseAccount.getFollowers().remove(account);

        account.setFollowings(followings);
        if (repository.updateOne(account)) {
            return "unFollow selected account and update your account successfully!";
        } else {
            return "can not unFollow selected account or update your account!";
        }
    }

    @Override
    public String deleteExistActiveAccount(HttpServletRequest req) {
        Account account = (Account) req.getSession().getAttribute("account");
        account.setDeleted(true);
        for (Post post : account.getPosts()) {
            post.setDeleted(true);
        }
        if (repository.updateOne(account)) {
            return "your account was deleted successfully!";
        } else {
            return "can not delete your account!";
        }
    }
}

