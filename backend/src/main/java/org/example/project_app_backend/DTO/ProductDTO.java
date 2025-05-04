package org.example.project_app_backend.DTO;

import lombok.Data;

import java.util.List;

@Data
public class ProductDTO {
    private Long productId;
    private String name;
    private double price;
    private int amount;
    private String description;
    private ImageDataDTO imageData;
    private List<StoreDTO> stores;

    private List<CustomerDTO> customer;
}
