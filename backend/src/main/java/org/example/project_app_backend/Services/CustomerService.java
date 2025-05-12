package org.example.project_app_backend.Services;

import org.example.project_app_backend.DTO.CustomerDTO;
import org.example.project_app_backend.Entity.Customer;
import org.example.project_app_backend.Repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepo customerRepo;

    @Autowired
    private EmailService emailService;

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public Customer registerCustomer(CustomerDTO dto) {
        if (customerRepo.findByEmail(dto.getEmail()).isPresent()) 
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Email already exists");
        Customer customer = new Customer();
        customer.setName(dto.getName());
        customer.setEmail(dto.getEmail());
        customer.setPassword(passwordEncoder.encode(dto.getPassword()));
        customer.setGender(dto.getGender());
        customer.setLatitude(dto.getLatitude());
        customer.setLongitude(dto.getLongitude());
        customer.setLevel(dto.getLevel());
        Customer saved = customerRepo.save(customer);
        emailService.sendRegistrationEmail(saved.getEmail(), saved.getName());
        return saved;
    }

    public Customer login(String email, String rawPassword) {
        Optional<Customer> optionalCustomer = customerRepo.findByEmail(email);
        if (optionalCustomer.isEmpty())
            throw new RuntimeException("Invalid email or password");
        Customer customer = optionalCustomer.get();
        if (!passwordEncoder.matches(rawPassword, customer.getPassword()))
            throw new RuntimeException("Invalid email or password");
        emailService.sendLoginNotification(customer.getEmail(), customer.getName());
        return customer;
    }

    public Customer register(CustomerDTO dto) {
        Customer customer = new Customer();
        customer.setName(dto.getName());
        customer.setEmail(dto.getEmail());
        customer.setPassword(passwordEncoder.encode(dto.getPassword()));
        customer.setGender(dto.getGender());
        customer.setLatitude(dto.getLatitude());
        customer.setLongitude(dto.getLongitude());
        customer.setLevel(dto.getLevel());
        return customerRepo.save(customer);
    }

    public void deleteCustomer(Long id) {
        if (!customerRepo.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Customer with ID " + id + " not found");
        }
        customerRepo.deleteById(id);
    }
}