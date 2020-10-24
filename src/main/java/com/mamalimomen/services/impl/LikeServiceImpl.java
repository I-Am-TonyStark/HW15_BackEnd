package com.mamalimomen.services.impl;

import com.mamalimomen.base.services.impl.BaseServiceImpl;
import com.mamalimomen.domains.Account;
import com.mamalimomen.domains.Like;
import com.mamalimomen.repositories.LikeRepository;
import com.mamalimomen.repositories.impl.LikeRepositoryImpl;
import com.mamalimomen.services.LikeService;

import javax.persistence.EntityManager;
import java.util.Optional;

public class LikeServiceImpl extends BaseServiceImpl<Long, Like, LikeRepository> implements LikeService {

    public LikeServiceImpl(EntityManager em) {
        super(new LikeRepositoryImpl(em));
    }

    @Override
    public Optional<Like> createNewLike(Account liker) {
        Like like = new Like();

        like.setLiker(liker);

        return Optional.of(like);
    }
}
