/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.io.File;
import java.io.InputStream;

/**
 *
 * @author denwi
 */
public class FruitDTO {
    private String productID;
    private String fruitName;
    private String image;
    private Object productImage;
    private String description;
    private String categoryName;
    private String categoryID;
    private double price;
    private int quantity;
    private int amount;
    private int status;

    public FruitDTO() {
    }

    public FruitDTO(String image, String productID) {
        this.image = image;
        this.productID = productID;
    }
    
    public FruitDTO(String productID, String fruitName, String image, String description, String categoryID, double price, int quantity) {
        this.productID = productID;
        this.fruitName = fruitName;
        this.image = image;
        this.description = description;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
    }
    
    public FruitDTO(String productID, String fruitName, String description, String categoryID, double price, int quantity, int status) {
        this.productID = productID;
        this.fruitName = fruitName;
        this.description = description;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
    }

    public FruitDTO(String productID, String fruitName, String description, double price, int quantity) {
        this.productID = productID;
        this.fruitName = fruitName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }
    
    public FruitDTO(String productID, String fruitName, String categoryName, int amount, double price, int quantity) {
        this.productID = productID;
        this.fruitName = fruitName;
//        this.image = image;
        this.categoryName = categoryName;
        this.price = price;
        this.quantity = quantity;
        this.amount = amount;
    }
    
    public FruitDTO(String productID, String fruitName, String image, String categoryName, int amount, double price, int quantity) {
        this.productID = productID;
        this.fruitName = fruitName;
        this.image = image;
        this.categoryName = categoryName;
        this.price = price;
        this.quantity = quantity;
        this.amount = amount;
    }
    
    public FruitDTO(String productID, String fruitName, double price, int quantity, String categoryID, String categoryName, String description, String image, int status) {
        this.productID = productID;
        this.fruitName = fruitName;
        this.image = image;
        this.description = description;
        this.categoryName = categoryName;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public Object getProductImage() {
        return productImage;
    }

    public void setProductImage(Object productImage) {
        this.productImage = productImage;
    }
    
    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getFruitName() {
        return fruitName;
    }

    public void setFruitName(String fruitName) {
        this.fruitName = fruitName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
}
