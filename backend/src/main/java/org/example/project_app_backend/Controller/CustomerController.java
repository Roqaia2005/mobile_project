package org.example.project_app_backend.Controller;

import org.example.project_app_backend.Services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class CustomerController {

    @Autowired
    private CustomerService customerService;
}
