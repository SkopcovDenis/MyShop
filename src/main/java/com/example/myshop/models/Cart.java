package com.example.myshop.models;

import javax.persistence.*;

@Entity
@Table(name = "productCart")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "personId")
    private int personId;

    @Column(name = "productId")
    private int productId;

    public Cart(int personId, int productId) {
        this.personId = personId;
        this.productId = productId;
    }

    public Cart() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
