package com.techelevator.authentication;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import com.techelevator.model.User;
import com.techelevator.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * SessionAuthProvider
 */
@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SessionAuthProvider implements AuthProvider {

    public static final String USER_KEY = "appCurrentUser";

    private HttpSession session;
    private UserDao dao;

    @Autowired
    public SessionAuthProvider(HttpSession session, UserDao dao) {
        this.session = session;
        this.dao = dao;
    }
    public HttpSession getSession(){
        return session;
    }
    @Override
    public boolean isLoggedIn() {
        return session.getAttribute(USER_KEY) != null;
    }

    @Override
    public User getCurrentUser() {
        return (User) session.getAttribute(USER_KEY);
    }

    @Override
    public boolean signIn(String username, String password) {
        User authenticatedUser = dao.getValidUserWithPassword(username, password);
        if (authenticatedUser != null) {
            session.setAttribute(USER_KEY, authenticatedUser);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void logOff() {
        session.removeAttribute(USER_KEY);
        session.invalidate();
    }

    @Override
    public boolean changePassword(String existingPassword, String newPassword) {
        User userFromSession = (User) session.getAttribute(USER_KEY);
        if (userFromSession == null) {
            return false;
        }
        User userFromDb = dao.getValidUserWithPassword(userFromSession.getUsername(), existingPassword);
        if (userFromDb != null && userFromDb.getId() == userFromSession.getId()) {
            dao.changePassword(userFromSession, newPassword);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void register(String username, String password, String role, String firstName, String lastName, String email, byte[] photoPath, double height, double weight, String description) {
        dao.saveUser(username, password, role, firstName, lastName, email, photoPath, height, weight, description);
    }

    @Override
    public boolean userHasRole(String[] roles) {
        User currentUser = getCurrentUser();
        if (currentUser != null && roles != null) {
            return Arrays.asList(roles).contains(currentUser.getRole());
        } else {
            return false;
        }
    }
}
