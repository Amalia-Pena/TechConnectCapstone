package com.techelevator.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.techelevator.authentication.PasswordHasher;

import com.techelevator.model.User;
import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcUserDao implements UserDao {

    private JdbcTemplate jdbcTemplate;
    private PasswordHasher passwordHasher;

    /**
     * Create a new user dao with the supplied data source and the password hasher
     * that will salt and hash all the passwords for users.
     *
     * @param dataSource an SQL data source
     * @param passwordHasher an object to salt and hash passwords
     */
    @Autowired
    public JdbcUserDao(DataSource dataSource, PasswordHasher passwordHasher) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.passwordHasher = passwordHasher;
    }

    /**
     * Save a new user to the database. The password that is passed in will be
     * salted and hashed before being saved. The original password is never
     * stored in the system. We will never have any idea what it is!
     *
     * @param userName the user name to give the new user
     * @param password the user's password
     * @param role the user's role
     * @return the new user
     */
    @Override
    public User saveUser(String userName, String password, String role, String firstName, String lastName, String email, byte[] photoPath, double height, double weight) {
        byte[] salt = passwordHasher.generateRandomSalt();
        String hashedPassword = passwordHasher.computeHash(password, salt);
        String saltString = new String(Base64.encode(salt));
        long newId = jdbcTemplate.queryForObject(
                "INSERT INTO app_user(user_name, password, salt, role, first_name, last_name, email, photo_path, height, weight ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING user_id", Long.class,
                userName, hashedPassword, saltString, role, firstName, lastName, email, photoPath, height, weight);

        User newUser = new User();
        newUser.setId(newId);
        newUser.setUsername(userName);
        newUser.setRole(role);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setEmail(email);
        newUser.setPhotoPath(photoPath);

        return newUser;
    }



    @Override
    public void changePassword(User user, String newPassword) {
        byte[] salt = passwordHasher.generateRandomSalt();
        String hashedPassword = passwordHasher.computeHash(newPassword, salt);
        String saltString = new String(Base64.encode(salt));

        jdbcTemplate.update("UPDATE app_user SET password=?, salt=? WHERE user_id=?", hashedPassword, saltString, user.getId());
    }

    /**
     * Look for a user with the given username and password. Since we don't
     * know the password, we will have to get the user's salt from the database,
     * hash the password, and compare that against the hash in the database.
     *
     * @param userName the user name of the user we are checking
     * @param password the password of the user we are checking
     * @return true if the user is found and their password matches
     */
    @Override
    public User getValidUserWithPassword(String userName, String password) {
        String sqlSearchForUser = "SELECT user_id, user_name, password, role, salt, first_name, last_name, email, photo_path, height, weight FROM app_user WHERE UPPER(user_name) = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
        if (results.next()) {
            String storedSalt = results.getString("salt");
            String storedPassword = results.getString("password");
            String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
            if (storedPassword.equals(hashedPassword)) {
                return mapResultToUser(results);
            } else {
                return null;
            }
        } else {
            return null;
        }

    }

    /**
     * Get all of the users from the database.
     * @return a List of user objects
     */
    @Override
    public List<User> getAllUsers() {

        String sqlSelectAllUsers = "SELECT user_id, user_name, role, first_name, last_name, email, photo_path, height, weight FROM app_user";
        return jdbcTemplate.query(sqlSelectAllUsers, new UserRowMapper());

    }

    @Override
    public User getUser(Long userId) {
        String sqlSelectUser = "SELECT user_id, user_name, role, first_name, last_name, email, photo_path, height, weight FROM app_user WHERE user_id = ?;";

        try {
            return jdbcTemplate.queryForObject(sqlSelectUser, new UserRowMapper(), userId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

    @Override
    public void updateUser(String firstName, String lastName, String email, double height, double weight, byte[] photoPath, Long userId) {
        String sqlUpdateUser = "UPDATE app_user SET first_name = ?, last_name = ?, email = ?, height = ?, weight = ?, photo_path = ? WHERE user_id = ?;";
        jdbcTemplate.update(sqlUpdateUser, firstName, lastName, email, height, weight, photoPath, userId);
    }


    class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet results, int i) {
            User user = new User();
            try {
                user.setId(results.getLong("user_id"));
                user.setUsername(results.getString("user_name"));
                user.setRole(results.getString("role"));
                user.setFirstName(results.getString("first_name"));
                user.setLastName(results.getString("last_name"));
                user.setEmail(results.getString("email"));
                user.setPhotoPath(results.getBytes("photo_path"));
                user.setHeight(results.getDouble("height"));
                user.setWeight(results.getLong("weight"));
                return user;
            }
            catch (SQLException e){
                return null;
            }
        }
    }

    private User mapResultToUser(SqlRowSet results) {
        User user = new User();
        user.setId(results.getLong("user_id"));
        user.setUsername(results.getString("user_name"));
        user.setRole(results.getString("role"));
        user.setFirstName(results.getString("first_name"));
        user.setLastName(results.getString("last_name"));
        user.setEmail(results.getString("email"));
        user.setPhotoPath((byte[]) results.getObject("photo_path"));
        user.setHeight(results.getDouble("height"));
        user.setWeight(results.getLong("weight"));
        return user;
    }


}
