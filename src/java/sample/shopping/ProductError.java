/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author denwi
 */
public class ProductError {
    private String productIDError;
    private String productNameError;
    private String productPriceError;
    private String productQuantityError;
    private String productImageError;
    private String productDescriptionError;
    private String categoryError;
    

    public ProductError() {
        this.productIDError = "";
        this.productNameError = "";
        this.productPriceError = "";
        this.productQuantityError = "";
        this.productImageError = "";
        this.categoryError = "";
        this.productDescriptionError = "";

    }

    public ProductError(String productIDError, String productNameError, String productPriceError, String productQuantityError, String productImageError, String productDescriptionError, String categoryError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.productPriceError = productPriceError;
        this.productQuantityError = productQuantityError;
        this.productImageError = productImageError;
        this.productDescriptionError = productDescriptionError;
        this.categoryError = categoryError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getProductPriceError() {
        return productPriceError;
    }

    public void setProductPriceError(String productPriceError) {
        this.productPriceError = productPriceError;
    }

    public String getProductQuantityError() {
        return productQuantityError;
    }

    public void setProductQuantityError(String productQuantityError) {
        this.productQuantityError = productQuantityError;
    }

    public String getProductImageError() {
        return productImageError;
    }

    public void setProductImageError(String productImageError) {
        this.productImageError = productImageError;
    }

    public String getProductDescriptionError() {
        return productDescriptionError;
    }

    public void setProductDescriptionError(String productDescriptionError) {
        this.productDescriptionError = productDescriptionError;
    }

    public String getCategoryError() {
        return categoryError;
    }

    public void setCategoryError(String categoryError) {
        this.categoryError = categoryError;
    }
    
    
}
