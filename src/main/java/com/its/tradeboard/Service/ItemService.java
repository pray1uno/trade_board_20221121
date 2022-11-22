package com.its.tradeboard.Service;

import com.its.tradeboard.DTO.ItemDTO;
import com.its.tradeboard.DTO.PageDTO;
import com.its.tradeboard.Repository.ItemRepository;
import com.its.tradeboard.commens.PagingConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemService {
    @Autowired
    private ItemRepository itemRepository;
    public List<ItemDTO> itemList(int page) {
        int pagingStart = (page - 1) * PagingConst.PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();

        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PagingConst.PAGE_LIMIT);

        System.out.println("page = " + page);
        System.out.println("pagingParam = " + pagingParam);

        List<ItemDTO> itemList = itemRepository.itemList(pagingParam);
        return itemList;
    }

    public PageDTO itemListParam(int page) {
        int itemCount = itemRepository.itemCount();
        int maxPage = (int) Math.ceil((double) itemCount / PagingConst.PAGE_LIMIT);
        int startPage = (((int) (Math.ceil((double) page / PagingConst.BLOCK_LIMIT))) - 1) * PagingConst.BLOCK_LIMIT + 1;
        int endPage = startPage + PagingConst.BLOCK_LIMIT -1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);

        System.out.println("page = " + page);
        System.out.println("pageDTO = " + pageDTO);

        return pageDTO;
    }
}
