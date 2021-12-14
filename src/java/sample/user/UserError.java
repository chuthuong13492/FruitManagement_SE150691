/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author denwi
 */
public class UserError {
    private String userIDError;
    private String fullNameError;
    private String roleIDError;
    private String phoneError;
    private String addressError;
    private String passwordError;
    private String confirmPassError;
    private String messageError;
    private String emailError;

    public UserError(String userIDError, String fullNameError, String roleIDError, String phoneError, String addressError, String passwordError, String confirmPassError, String messageError, String emailError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.passwordError = passwordError;
        this.confirmPassError = confirmPassError;
        this.messageError = messageError;
        this.emailError = emailError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }
    
    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.roleIDError = "";
        this.phoneError = "";
        this.addressError = "";
        this.passwordError = "";
        this.confirmPassError = "";
        this.messageError = "";
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPassError() {
        return confirmPassError;
    }

    public void setConfirmPassError(String confirmPassError) {
        this.confirmPassError = confirmPassError;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }
       
}
