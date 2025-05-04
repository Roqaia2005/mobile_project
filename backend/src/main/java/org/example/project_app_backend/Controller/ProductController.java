package org.example.project_app_backend.Controller;


import org.example.project_app_backend.Entity.Product;
import org.example.project_app_backend.Entity.Store;
import org.example.project_app_backend.Services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping
public class ProductController {

    @Autowired
    private ProductService productService;


    @GetMapping("/getProducts")
    public List<Product> getAllProducts(){
        return productService.getAllProducts();
    }

    @GetMapping("/{storeId}/getStoreProducts")
    public List<Product> getAllStoreProducts(@PathVariable Long storeId){
        return productService.getAllStoreProducts(storeId);
    }

}
