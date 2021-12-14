/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

/**
 *
 * @author denwi
 */
public class OrderError {
    private String orderIDError;
    private String emailError;
    private String addressError;
    private String phoneError;

    public OrderError() {
        this.orderIDError = "";
        this.emailError = "";
        this.addressError = "";
        this.phoneError = "";
    }

    public OrderError(String orderIDError, String emailError, String addressError, String phoneError) {
        this.orderIDError = orderIDError;
        this.emailError = emailError;
        this.addressError = addressError;
        this.phoneError = phoneError;
    }

    public String getOrderIDError() {
        return orderIDError;
    }

    public void setOrderIDError(String orderIDError) {
        this.orderIDError = orderIDError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }
}
