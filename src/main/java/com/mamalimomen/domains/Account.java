package com.mamalimomen.domains;

import com.mamalimomen.base.domains.BaseEntity;
import org.hibernate.annotations.SelectBeforeUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@SelectBeforeUpdate
@Table(name = "tbl_account", catalog = "HW15_One", schema = "HW15_One")
@NamedQueries({
        @NamedQuery(
                name = "Account.findOneByUsername",
                query = "SELECT a FROM Account a WHERE a.user.username = ?1"),
        @NamedQuery(
                name = "Account.findOneActiveByUsername",
                query = "SELECT a FROM Account a WHERE a.deleted = FALSE AND a.user.username = ?1")
})
public final class Account extends BaseEntity implements Comparable<Account> {

    @Transient
    private static final long serialVersionUID = 8296892016184394238L;

    @Embedded
    private User user;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "fk_account")
    private List<Post> posts = new ArrayList<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "saver_saved", joinColumns = {@JoinColumn(name = "account_id")}, inverseJoinColumns = {@JoinColumn(name = "post_id")},
            uniqueConstraints = {@UniqueConstraint(name = "unique_saver_saved", columnNames = {"account_id", "post_id"})})
    private List<Post> savedPosts = new ArrayList<>();

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(name = "follower_following", joinColumns = {@JoinColumn(name = "follower_id")}, inverseJoinColumns = {@JoinColumn(name = "following_id")},
            uniqueConstraints = {@UniqueConstraint(name = "unique_follower_following", columnNames = {"follower_id", "following_id"})})
    private List<Account> followings = new ArrayList<>();

    @ManyToMany(mappedBy = "followings")
    private List<Account> followers = new ArrayList<>();

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public List<Account> getFollowings() {
        return followings;
    }

    public void setFollowings(List<Account> followings) {
        this.followings = followings;
    }

    public List<Account> getFollowers() {
        return followers;
    }

    public void setFollowers(List<Account> followers) {
        this.followers = followers;
    }

    public List<Post> getSavedPosts() {
        return savedPosts;
    }

    public void setSavedPosts(List<Post> savedPosts) {
        this.savedPosts = savedPosts;
    }

    public void addPost(Post post) {
        this.getPosts().add(post);
    }

    public void addFollowing(Account following) {
        this.getFollowings().add(following);
        following.getFollowers().add(this);
    }

    public void removeFollowing(Account chooseAccount) {
        this.getFollowings().remove(chooseAccount);
        chooseAccount.getFollowers().remove(this);
    }

    public void addSavedPost(Post saved) {
        this.getSavedPosts().add(saved);
    }

    @Override
    public String toString() {
        return String.format("Followings: %d\tFollowers: %d\tPosts: %d<br/>%s", getFollowings().size(), getFollowers().size(), getPosts().size(), getUser());
    }

    @Override
    public int compareTo(Account a) {
        return this.getId().compareTo(a.getId());
    }
}
