package org.example.project_app_backend.Services;

import org.example.project_app_backend.Entity.Product;
import org.example.project_app_backend.Entity.Store;
import org.example.project_app_backend.Repository.ProductRepo;
import org.example.project_app_backend.Repository.StoreRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepo productRepo;




    public List<Product> getAllProducts(){
        List<Product> products = productRepo.findAll();
        return products;
    }

    public List<Product> getAllStoreProducts(Long storeId){
        return  productRepo.findProductsByStoreId(storeId);
    }

}
