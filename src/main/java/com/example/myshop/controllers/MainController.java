package com.example.myshop.controllers;

import com.example.myshop.repositories.ProductRepository;
import com.example.myshop.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/product")
public class MainController {

    private final ProductRepository productRepository;
    private final ProductService productService;

    @Autowired
    public MainController(ProductRepository productRepository, ProductService productService) {
        this.productRepository = productRepository;
        this.productService = productService;
    }

    // Данный метод предназначен для отображении товаров без прохождения аутентификации и авторизации
    @GetMapping("")
    public String getAllProduct(Model model) {
        model.addAttribute("products", productService.getAllProduct());
        return "product/product";
    }

    @GetMapping("/info/{id}")
    public String infoProduct(@PathVariable("id") int id, Model model) {
        model.addAttribute("product", productService.getProductId(id));
        return "product/infoProduct";
    }

    @PostMapping("/search")
    public String productSearch(@RequestParam("search") String search, @RequestParam("from") String from, @RequestParam("to") String to, @RequestParam(value = "price", required = false, defaultValue = "") String price, @RequestParam(value = "category", required = false, defaultValue = "") String category, Model model) {
        System.out.println(search);
        System.out.println(from);
        System.out.println(to);
        System.out.println(price);
        System.out.println(category);
        // Если диапазон цен от и до не пустой
        if (!from.isEmpty() & !to.isEmpty()) {
            // Если сортировка по цене выбрана
            if (!price.isEmpty()) {
                // Если в качестве сортировки выбрана сортировкам по возрастанию
                if (price.equals("sortedByAscendingPrice")) {
                    // Если категория товара не пустая
                    if (!category.isEmpty()) {
                        // Если категория равная мебели
                        if (category.equals("furniture")) {
                            model.addAttribute("searchProduct", productRepository.findByTitleAndCategoryOrderByPrice(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to), 1));
                            // Если категория равная бытовой техники
                        } else if (category.equals("appliances")) {
                            model.addAttribute("searchProduct", productRepository.findByTitleAndCategoryOrderByPrice(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to), 2));
                            // Если категория равная одежде
                        } else if (category.equals("clothes")) {
                            model.addAttribute("searchProduct", productRepository.findByTitleAndCategoryOrderByPrice(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to), 3));
                        }
                        // Если категория не выбрана
                    } else {
                        model.addAttribute("searchProduct", productRepository.findByTitleOrderByPrice(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to)));
                    }

                    // Если в качестве сортировки выбрана сортировкам по убыванию
                } else if (price.equals("sortedByDescendingPrice")) {

                    // Если категория не пустая
                    if (!category.isEmpty()) {
                        // Если категория равная мебели
                        if (category.equals("furniture")) {
                            model.addAttribute("searchProduct", productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to), 1));
                            // Если категория равная бытовой техники
                        } else if (category.equals("appliances")) {
                            model.addAttribute("searchProduct", productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to), 2));
                            // Если категория равная одежде
                        } else if (category.equals("clothes")) {
                            model.addAttribute("searchProduct", productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to), 3));
                        }
                        // Если категория не выбрана
                    } else {
                        model.addAttribute("searchProduct", productRepository.findByTitleOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to)));
                    }
                }
            } else {
                model.addAttribute("searchProduct", productRepository.findByTitleAndPriceGreaterThanEqualAndPriceLessThan(search.toLowerCase(), Float.parseFloat(from), Float.parseFloat(to)));
            }
        } else {
            model.addAttribute("searchProduct", productRepository.findByTitleContainingIgnoreCase(search));
        }
        model.addAttribute("valueSearch", search);
        model.addAttribute("valuePriceFrom", from);
        model.addAttribute("valuePriceTo", to);
        model.addAttribute("products", productService.getAllProduct());
        return "/product/product";
    }
}
