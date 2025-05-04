package org.example.project_app_backend.Entity;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Store {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long storeId;

    @Column
    private String name;

    @Column
    private String type;
    @Column
    private double rating;
    @Column
    private double latitude;
    @Column
    private double longitude;
    @Column
    private String address;
    @Column
    private String description;


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id")
    private ImageData imageData;

    @ManyToMany
    @JoinTable(
            name = "store_product",
            joinColumns = @JoinColumn(name = "store_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )

    private List<Product> products;

    public Store(String name, String type, double rating, double latitude, double longitude,
                 String address, String description, ImageData imageData, List<Product> products) {
        this.name = name;
        this.type = type;
        this.rating = rating;
        this.latitude = latitude;
        this.longitude = longitude;
        this.address = address;
        this.description = description;
        this.imageData = imageData;
        this.products = products;
    }


}
