package org.example.project_app_backend.DTO;

import lombok.Data;

@Data
public class ImageDataDTO {
    private int id;
    private String imageName;
    private String imageType;
    private byte[] imageData;
}
