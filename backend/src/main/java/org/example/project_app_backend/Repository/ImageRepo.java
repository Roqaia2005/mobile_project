package org.example.project_app_backend.Repository;

import org.example.project_app_backend.Entity.Customer;
import org.example.project_app_backend.Entity.ImageData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepo extends JpaRepository<ImageData, Integer> {
}
