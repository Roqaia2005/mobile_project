package org.example.project_app_backend.Entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long productId;

    @Column
    private String name;
    @Column
    private double price;
    @Column
    private int amount;
    @Column
    private String description;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id")
    private ImageData imageData;


    @ManyToMany(mappedBy = "products")
    @JsonIgnore
    private List<Store> stores;
    @JsonIgnore
    @ManyToMany(mappedBy = "products")

    private List<Customer> customers;



    public Product(String name, double price, int amount, String description, ImageData imageData, List<Store> stores, List<Customer> customers) {
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.description = description;
        this.imageData = imageData;
        this.stores = stores;
        this.customers = customers;
    }


}
