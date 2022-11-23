package com.its.tradeboard.Controller;

import com.its.tradeboard.DTO.ItemDTO;
import com.its.tradeboard.DTO.PageDTO;
import com.its.tradeboard.Service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ItemController {
    @Autowired
    private ItemService itemService;

    @GetMapping("/item/mainPaging")
    public String mainPaging(Model model,
                             @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        List<ItemDTO> itemDTOList = itemService.itemList(page);
        PageDTO pageDTO = itemService.itemListParam(page);

        model.addAttribute("itemList", itemDTOList);
        model.addAttribute("paging", pageDTO);
        return "trade_main";
    }

    @PostMapping("/item/upload")
    public String itemUpload(@ModelAttribute ItemDTO itemDTO) {
        ItemDTO result = itemService.itemUpload(itemDTO);

        if (result != null) {
            return "redirect:/item/upload";
        } else {
            return "trade_main";
        }
    }

    @GetMapping("/item/upload")
    public String uploadList(Model model,
                             @ModelAttribute ItemDTO itemDTO) {
        List<ItemDTO> itemDTOList = itemService.uploadList();
        model.addAttribute("itemDTOList", itemDTOList);
        return "redirect:/item/mainPaging";
    }


}
