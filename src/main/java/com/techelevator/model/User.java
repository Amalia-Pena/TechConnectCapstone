package com.techelevator.model;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import java.nio.charset.MalformedInputException;

/**
 * User
 */
public class User {

    @NotBlank(message = "Username is required")
    private String username;

    @NotBlank(message = "Role is required")
    private String role;
    private long id;

    @NotBlank(message = "Password is required")
    @Size (min = 4, max = 31, message = "Invalid format")
    private String password;
    @Size (min = 4, max = 31, message = "Invalid format")
    private String confirmPassword;

    private boolean passwordMatching;

    @NotBlank(message = "First Name is required")
    private String firstName;

    @NotBlank(message = "Last Name is required")
    private String lastName;

    @Email(message = "Please enter a valid email address")
    private String email;

    private String description;

    //Added for adding photo to DB
    private byte[] photoPath;


    @Range(min = (long) 1, max = (long) 120.0, message = "height is required")
    private double height;

    @Range(min = (long) 1, max = (long) 1000, message = "weight is required")
    private double weight;

    public User() {
    }

    public User(String firstName, String lastName, String email, double height, double weight, byte[] photoPath, String description) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.height = height;
        this.weight = weight;
        this.photoPath = photoPath;
        this.description = description;
    }

    public User(String userName, String firstName, String lastName, String email, byte[] photoPath, String description) {
        this.username = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.photoPath = photoPath;
        this.description = description;
    }

    //  public MultipartFile getPhotoPathContainer() {
   //     return getPhotoPathContainer;
  //  }

    public void setPhotoPathContainer(MultipartFile photoPathContainer) {

    }


    @AssertTrue(message = "Passwords must match")
    public boolean isPasswordMatching() {
        if (password != null) {
            return password.equals(confirmPassword);
        }
        return true;
    }

    public String getPassword() {
        return password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public byte[] getPhotoPath() {
        return photoPath;
    }

    public String getDescription() {
        return description;
    }

    /**
     * @return the role
     */
    public String getRole() {
        return role;
    }

    public double getHeight() {
        return height;
    }

    public double getWeight() {
        return weight;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }


    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhotoPath(byte[] photoPath) {
        this.photoPath = photoPath;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}