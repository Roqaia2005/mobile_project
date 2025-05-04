package org.example.project_app_backend.Services;

import org.example.project_app_backend.DTO.StoreDTO;
import org.example.project_app_backend.Entity.Store;
import org.example.project_app_backend.Repository.StoreRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreService {

    @Autowired
    private StoreRepo storeRepo;


    public List<Store> getAllStores(){
        List<Store> stores = storeRepo.findAll();

        return storeRepo.findAll();
    }

    public List<Store> getAllProductStores(Long productId){
        List<Store> st= storeRepo.findStoresByProductId(productId);
        return storeRepo.findStoresByProductId(productId);
    }
}
