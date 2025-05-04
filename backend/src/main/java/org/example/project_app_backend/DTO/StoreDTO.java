package org.example.project_app_backend.DTO;

import lombok.Data;

import java.util.List;

@Data
public class StoreDTO {
    private Long storeId;
    private String name;
    private String type;
    private double rating;
    private double latitude;
    private double longitude;
    private String address;
    private String description;
    private ImageDataDTO imageData;
    private List<ProductDTO> products;
}
