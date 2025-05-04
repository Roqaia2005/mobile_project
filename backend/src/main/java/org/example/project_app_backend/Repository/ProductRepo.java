package org.example.project_app_backend.Repository;


import org.example.project_app_backend.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Long> {

    @Query("SELECT p FROM Product p JOIN p.stores s WHERE s.storeId = :storeId")
    List<Product> findProductsByStoreId(@Param("storeId") Long storeId);

}
