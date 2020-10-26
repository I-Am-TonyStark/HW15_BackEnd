package com.mamalimomen.services;

import com.mamalimomen.base.services.BaseService;
import com.mamalimomen.domains.Account;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

public interface AccountService extends BaseService<Long, Account> {
    String createNewAccount(HttpServletRequest req);

    Optional<Account> retrieveExistActiveAccount(HttpServletRequest req);

    String updateExistActiveAccountPassword(HttpServletRequest req);

    String updateExistActiveAccountInformation(HttpServletRequest req);

    String addExistActiveAccountAPost(HttpServletRequest req);

    String addExistActiveAccountASavedPost(HttpServletRequest req);

    String removeExistActiveAccountAPost(HttpServletRequest req);

    String removeExistActiveAccountASavedPost(HttpServletRequest req);

    String addExistActiveAccountAFollowing(HttpServletRequest req);

    String removeExistActiveAccountAFollowing(HttpServletRequest req);

    String deleteExistActiveAccount(HttpServletRequest req);
}
