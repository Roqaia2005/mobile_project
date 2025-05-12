package org.example.project_app_backend.Controller;


import org.example.project_app_backend.Entity.Store;
import org.example.project_app_backend.Services.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping()
public class StoreController {

    @Autowired
    private StoreService storeService;



    @GetMapping("/getStores")
    public List<Store> getAllStores(){
        return storeService.getAllStores();
    }

    @GetMapping("/{productId}/getProductStores")
    public List<Store> getAllProductStores(@PathVariable Long productId){
        return storeService.getAllProductStores(productId);
    }

}
