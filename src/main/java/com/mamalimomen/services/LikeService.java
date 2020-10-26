package com.mamalimomen.services;

import com.mamalimomen.base.services.BaseService;
import com.mamalimomen.domains.Like;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

public interface LikeService extends BaseService<Long, Like> {

    Optional<Like> createNewLike(HttpServletRequest req);
}
