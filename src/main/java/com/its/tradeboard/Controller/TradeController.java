package com.its.tradeboard.Controller;

import com.its.tradeboard.DTO.ItemDTO;
import com.its.tradeboard.DTO.PageDTO;
import com.its.tradeboard.Service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TradeController {
    @Autowired
    private TradeService tradeService;
    @GetMapping("/trade/main")
    public String tradeMain() {
        return "redirect:/item/mainPaging";
    }

    @GetMapping("/trade/price")
    public String tradePrice() {
        return "trade_price";
    }

    @GetMapping("/trade/wishList")
    public String tradeWishList() {
        return "trade_wishList";
    }

    @GetMapping("/trade/sales")
    public String tradeSales(Model model,
                             HttpSession session,
                             @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        System.out.println("model = " + model + ", session = " + session + ", page = " + page);
        String userId = (String) session.getAttribute("userLogin");
        List<ItemDTO> itemDTOList = tradeService.salesList(userId);
        model.addAttribute("mySalesList", itemDTOList);

        List<ItemDTO> salesPaging = tradeService.salesPaging(page);
        PageDTO pageDTO = tradeService.salesPagingParam(page);
        model.addAttribute("salesPaging", salesPaging);
        model.addAttribute("salePage", pageDTO);

        System.out.println("model = " + model + ", session = " + session + ", page = " + page);
        return "trade_sales";
    }


    @GetMapping("/trade/completion")
    public String tradeCompletion() {
        return "trade_completion";
    }

    @GetMapping("/trade/cancel")
    public String tradeCancel(@RequestParam("id") Long id,
                              Model model) {
        int result = tradeService.cancel(id);
        model.addAttribute("cancel", result);
        return "redirect:/trade/sales";
    }
}
