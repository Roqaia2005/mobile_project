package org.example.project_app_backend.Entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "ImageData")
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class ImageData {

    @Id
    @Column()
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String imageName;
    private String imageType;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] imageData;


    public ImageData(String imageName, String imageType, byte[] imageData) {
        this.imageName = imageName;
        this.imageType = imageType;
        this.imageData = imageData;
    }


}
