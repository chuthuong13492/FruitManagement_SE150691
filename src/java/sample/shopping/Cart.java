/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author denwi
 */
public class Cart {
    private Map<String, FruitDTO> cart;

    public Cart(Map<String, FruitDTO> cart) {
        this.cart = cart;
    }

    public Cart() {
    }

    public Map<String, FruitDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, FruitDTO> cart) {
        this.cart = cart;
    }
    
    public void add(FruitDTO fruit){
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(fruit.getProductID())){
            int currentQuantity  = this.cart.get(fruit.getProductID()).getQuantity();
            fruit.setQuantity(currentQuantity  + fruit.getQuantity());
        }
        cart.put(fruit.getProductID(), fruit);
    }
    
    public void delete(String id){
        if(this.cart == null) return;
        if(this.cart.containsKey(id)){
            this.cart.remove(id);
        } 
    }
    
    public void update(FruitDTO newFruit){
        if(this.cart == null) return;
        if(this.cart.containsKey(newFruit.getProductID())){
            this.cart.replace(newFruit.getProductID(), newFruit);
        }
    }
}
