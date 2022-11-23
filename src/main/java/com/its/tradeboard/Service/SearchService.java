package com.its.tradeboard.Service;

import com.its.tradeboard.DTO.ItemDTO;
import com.its.tradeboard.Repository.ItemRepository;
import com.its.tradeboard.Repository.SearchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SearchService {
    @Autowired
    private SearchRepository searchRepository;
    public List<ItemDTO> searchSale(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("searchType", searchType);
        searchParam.put("q", q);
        List<ItemDTO> searchList = searchRepository.searchSale(searchParam);

        System.out.println("searchType = " + searchType + ", q = " + q);
        return searchList;
    }
}
