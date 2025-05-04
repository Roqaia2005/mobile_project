package org.example.project_app_backend.Repository;

import org.example.project_app_backend.Entity.Product;
import org.example.project_app_backend.Entity.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface StoreRepo extends JpaRepository<Store, Long> {

    @Query("SELECT s FROM Store s JOIN s.products p WHERE p.productId = :productId")
    List<Store> findStoresByProductId(@Param("productId") Long productId);

}
