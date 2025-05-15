package org.example.project_app_backend.Controller;

import org.example.project_app_backend.DTO.CustomerDTO;
import org.example.project_app_backend.Entity.Customer;
import org.example.project_app_backend.Services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/customers")

public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @PostMapping("/register")
    public ResponseEntity<Customer> register(@RequestBody CustomerDTO dto) {
        Customer customer = customerService.registerCustomer(dto);
        return ResponseEntity.ok(customer);
    }

    @PostMapping("/login")
    public ResponseEntity<Customer> login(@RequestParam String email,
                                            @RequestParam String password) {
        return ResponseEntity.ok(customerService.login(email, password));
    }

    @DeleteMapping("/{id}")
    public String deleteCustomer(@PathVariable Long id) {
        customerService.deleteCustomer(id);
        return "Customer with ID " + id + " has been deleted successfully";
    }
}
