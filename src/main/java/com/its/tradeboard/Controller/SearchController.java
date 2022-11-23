package com.its.tradeboard.Controller;

import com.its.tradeboard.DTO.ItemDTO;
import com.its.tradeboard.Service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class SearchController {
    @Autowired
    private SearchService searchService;
    @GetMapping("/search/sale")
    public String searchSale(@RequestParam("searchType") String searchType,
                             @RequestParam("q") String q,
                             Model model) {
        List<ItemDTO> searchList = searchService.searchSale(searchType, q);
        model.addAttribute("itemList", searchList);

        System.out.println("searchType = " + searchType + ", q = " + q + ", model = " + model);
        return "trade_main";
    }
}
