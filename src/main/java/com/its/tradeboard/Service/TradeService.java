package com.its.tradeboard.Service;

import com.its.tradeboard.DTO.ItemDTO;
import com.its.tradeboard.DTO.PageDTO;
import com.its.tradeboard.DTO.UserDTO;
import com.its.tradeboard.Repository.TradeRepository;
import com.its.tradeboard.commens.PagingConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TradeService {
    @Autowired
    private TradeRepository tradeRepository;

    public List<ItemDTO> salesList(String userId) {
        return tradeRepository.salesList(userId);
    }


    public int cancel(Long id) {
        return tradeRepository.cancel(id);
    }

    public List<ItemDTO> salesPaging(int page) {
        int pagingStart2 = (page - 1) * PagingConst.PAGE_LIMIT;
        Map<String, Integer> pagingParam2 = new HashMap<>();

        pagingParam2.put("start2", pagingStart2);
        pagingParam2.put("limit2", PagingConst.PAGE_LIMIT);

        List<ItemDTO> itemDTOList = tradeRepository.salesPaging(pagingParam2);
        return itemDTOList;
    }

    public PageDTO salesPagingParam(int page) {
        int itemCount2 = tradeRepository.salesCount();
        int maxPage = (int) Math.ceil((double) itemCount2 / PagingConst.PAGE_LIMIT);
        int startPage = (((int) (Math.ceil((double) page / PagingConst.BLOCK_LIMIT))) - 1) * PagingConst.BLOCK_LIMIT + 1;
        int endPage = startPage + PagingConst.BLOCK_LIMIT - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);

        return pageDTO;
    }

}
