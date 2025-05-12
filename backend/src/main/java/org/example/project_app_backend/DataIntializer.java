package org.example.project_app_backend;

import org.example.project_app_backend.Entity.ImageData;
import org.example.project_app_backend.Entity.Product;
import org.example.project_app_backend.Entity.Store;
import org.example.project_app_backend.Repository.ProductRepo;
import org.example.project_app_backend.Repository.StoreRepo;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class DataIntializer {


        @Bean
        CommandLineRunner initDatabase(ProductRepo productRepo, StoreRepo storeRepo) {
                return args -> {

                if (storeRepo.count() > 0 || productRepo.count() > 0) {
                        System.out.println("Database already initialized. Skipping data setup.");
                        return;
                }

                Store abouTarek = new Store("Abou Tarek", "restaurant", 4.7, 30.0508, 31.2436,
                        "16 Marouf, Off Talaat Harb, Downtown Cairo", "Famous for Koshary",
                        createStoreImage("aboutarek.png", "image/png"), new ArrayList<>());

                Store bazooka = new Store("Bazooka", "restaurant", 4.3, 30.0611, 31.3260,
                        "Nasr City, Cairo", "Popular for fried chicken and sandwiches",
                        createStoreImage("bazooka.png", "image/png"), new ArrayList<>());

                Store mcdonalds = new Store("McDonald's", "restaurant", 4.0, 30.0455, 31.2315,
                        "Various branches, Cairo", "Global fast food chain",
                        createStoreImage("mcDonalds.png", "image/png"), new ArrayList<>());

                Store mallOfEgypt = new Store("Mall of Egypt", "restaurant", 4.1, 29.9714, 30.9570,
                        "Mall of Egypt, 6th October City", "Beverages and light meals",
                        createStoreImage("MallOfEgypt.png", "image/png"), new ArrayList<>());

                Store cityStarsCafe = new Store("City Stars Cafe", "restaurant", 4.0, 30.0721, 31.3460,
                        "CityStars Mall, Heliopolis", "Coffee and snacks inside CityStars Mall",
                        createStoreImage("CityStars.png", "image/png"), new ArrayList<>());

                Store kheirZaman = new Store("Kheir Zaman Eatery", "restaurant", 3.9, 30.0591, 31.3172,
                        "Across Cairo branches", "Quick bites and grocery deli",
                        createStoreImage("kheir zaman.png", "image/png"), new ArrayList<>());

                Store mallOfArabia = new Store("Mall of Arabia Food Court", "restaurant", 4.2, 30.0020, 30.9744,
                        "Mall of Arabia, 6th October City", "Various international chains",
                        createStoreImage("MallOfArabia.png", "image/png"), new ArrayList<>());

                Store zooba = new Store("Zooba", "restaurant", 4.6, 30.0424, 31.2315,
                        "Zamalek, Cairo", "Modern Egyptian street food",
                        createStoreImage("zooba.png", "image/png"), new ArrayList<>());

                Store cilantro = new Store("Cilantro", "cafe", 4.1, 30.0612, 31.2190,
                        "Zamalek, Cairo", "Trendy coffee shop with snacks and beverages",
                        createStoreImage("cilantro.png", "image/png"), new ArrayList<>());

                Store elFishawy = new Store("El Fishawy", "cafe", 4.8, 30.0477, 31.2625,
                        "Khan el-Khalili, Cairo", "Historic Egyptian cafe in Khan El-Khalili",
                        createStoreImage("fishawy.png", "image/png"), new ArrayList<>());

                Product koshary = new Product("Koshary", 3.0, 70, "Traditional Egyptian dish",
                        createProductImage("Koshary1.jpg", "image/jpeg"), new ArrayList<>(), new ArrayList<>());

                Product kosharyExtra = new Product("Koshary Extra", 3.2, 50, "Spicy Egyptian Koshary",
                        createProductImage("Koshary2.jpg", "image/jpeg"), new ArrayList<>(), new ArrayList<>());

                Product kosharyMax = new Product("Koshary Max", 3.5, 40, "Koshary with extra sauce and topping",
                        createProductImage("Koshary3.jpg", "image/jpeg"), new ArrayList<>(), new ArrayList<>());

                Product sandwichBeef = new Product("Sandwich beef", 1.2, 90, "Beef sandwich with lettuce",
                        createProductImage("sandwish1.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product sandwichChicken = new Product("Sandwich chicken", 1.3, 85, "Chicken sandwich with tomato",
                        createProductImage("sandwish2.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product sandwichTune = new Product("Sandwich tune", 1.1, 95, "Tuna sandwich with pickles",
                        createProductImage("sandwish3.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product sandwichCheese = new Product("Sandwich cheese", 1.4, 80, "Vegetarian sandwich with cheese",
                        createProductImage("sandwish4.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product dessert = new Product("Dessert", 2.5, 60, "Sweet chocolate dessert",
                        createProductImage("dessert.jpg", "image/jpeg"), new ArrayList<>(), new ArrayList<>());

                Product apple = new Product("Apple", 0.5, 100, "Fresh red apple",
                        createProductImage("apple.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product banana = new Product("Banana", 0.3, 120, "Ripe yellow banana",
                        createProductImage("banana.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product orange = new Product("Orange", 0.4, 100, "Juicy orange fruit",
                        createProductImage("orange.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product popcorn = new Product("Popcorn", 1.0, 80, "Salty butter popcorn",
                        createProductImage("popcorn.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product chips = new Product("Chips", 1.0, 200, "Crunchy potato chips",
                        createProductImage("chips.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product doritos = new Product("Doritos", 1.2, 150, "Spicy corn chips",
                        createProductImage("doritos.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product water = new Product("Water", 0.5, 300, "Bottled mineral water",
                        createProductImage("water.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product shakshoka = new Product("Shakshoka", 2.3, 75, "Egg and tomato shakshoka",
                        createProductImage("shakshoka.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product tameia = new Product("Tameia", 1.8, 100, "Crispy Egyptian falafel",
                        createProductImage("tameia.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product omlet = new Product("Omlet", 2.0, 60, "Delicious fluffy omlet",
                        createProductImage("omlet.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product greenTea = new Product("Green Tea", 1.0, 80, "Refreshing green tea",
                        createProductImage("green_tea.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product hotChocolate = new Product("Hot Chocolate", 1.8, 40, "Hot chocolate drink",
                        createProductImage("hot_chocolate.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product blackCoffee = new Product("Black Coffee", 1.5, 50, "Strong black coffee",
                        createProductImage("black_coffe.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product tea = new Product("Tea", 0.8, 120, "Traditional black tea",
                        createProductImage("tea.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                Product whiteCoffee = new Product("White Coffee", 1.6, 90, "Milky white coffee",
                        createProductImage("white_coffe.png", "image/png"), new ArrayList<>(), new ArrayList<>());

                abouTarek.getProducts().add(koshary);
                abouTarek.getProducts().add(kosharyExtra);
                abouTarek.getProducts().add(kosharyMax);

                koshary.getStores().add(abouTarek);
                kosharyExtra.getStores().add(abouTarek);
                kosharyMax.getStores().add(abouTarek);

                bazooka.getProducts().add(sandwichBeef);
                bazooka.getProducts().add(sandwichChicken);
                bazooka.getProducts().add(dessert);

                // Add store to each product
                sandwichBeef.getStores().add(bazooka);
                sandwichChicken.getStores().add(bazooka);
                dessert.getStores().add(bazooka);

                mcdonalds.getProducts().add(sandwichTune);
                mcdonalds.getProducts().add(sandwichCheese);
                mcdonalds.getProducts().add(dessert);

                sandwichTune.getStores().add(mcdonalds);
                sandwichCheese.getStores().add(mcdonalds);
                dessert.getStores().add(mcdonalds);

                mallOfEgypt.getProducts().addAll(List.of(
                        apple, banana, orange, popcorn, chips, doritos, water
                ));

                apple.getStores().add(mallOfEgypt);
                banana.getStores().add(mallOfEgypt);
                orange.getStores().add(mallOfEgypt);
                popcorn.getStores().add(mallOfEgypt);
                chips.getStores().add(mallOfEgypt);
                doritos.getStores().add(mallOfEgypt);
                water.getStores().add(mallOfEgypt);

                cityStarsCafe.getProducts().addAll(List.of(apple, banana, orange));

                apple.getStores().add(cityStarsCafe);
                banana.getStores().add(cityStarsCafe);
                orange.getStores().add(cityStarsCafe);

                kheirZaman.getProducts().addAll(List.of(orange, popcorn, chips));

                orange.getStores().add(kheirZaman);
                popcorn.getStores().add(kheirZaman);
                chips.getStores().add(kheirZaman);

                mallOfArabia.getProducts().addAll(List.of(chips, doritos, water));

                chips.getStores().add(mallOfArabia);
                doritos.getStores().add(mallOfArabia);
                water.getStores().add(mallOfArabia);

                zooba.getProducts().addAll(List.of(water, shakshoka, tameia, omlet));

                water.getStores().add(zooba);
                shakshoka.getStores().add(zooba);
                tameia.getStores().add(zooba);
                omlet.getStores().add(zooba);

                cilantro.getProducts().addAll(List.of(greenTea, hotChocolate, blackCoffee, water));

                greenTea.getStores().add(cilantro);
                hotChocolate.getStores().add(cilantro);
                blackCoffee.getStores().add(cilantro);
                water.getStores().add(cilantro); // 'water' is shared between Zooba and Cilantro

                elFishawy.getProducts().addAll(List.of(tea, whiteCoffee, water));

                tea.getStores().add(elFishawy);
                whiteCoffee.getStores().add(elFishawy);
                water.getStores().add(elFishawy); // 'water' is shared across stores

                productRepo.saveAll(List.of(
                        apple, banana, blackCoffee, chips, dessert, doritos, greenTea, hotChocolate,
                        koshary, kosharyExtra, kosharyMax, omlet, orange, popcorn,
                        sandwichBeef, sandwichChicken, sandwichTune, sandwichCheese,
                        shakshoka, tameia, tea, water, whiteCoffee
                ));
                storeRepo.saveAll(List.of(abouTarek, bazooka, cilantro, elFishawy, mallOfEgypt, cityStarsCafe, kheirZaman, mallOfArabia, mcdonalds, zooba));
                };
        }

        private ImageData createStoreImage(String fileName, String contentType) throws IOException {
                ClassPathResource imgFile = new ClassPathResource("StoreImages/" + fileName);
                byte[] data = imgFile.getInputStream().readAllBytes();
                return new ImageData(fileName, contentType, data);
        }

        private ImageData createProductImage(String fileName, String contentType) throws IOException {
                ClassPathResource imgFile = new ClassPathResource("ProductImages/" + fileName);
                byte[] data = imgFile.getInputStream().readAllBytes();
                return new ImageData(fileName, contentType, data);
        }

}
