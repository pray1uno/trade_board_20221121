package com.its.tradeboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TradeController {
    @GetMapping("/trade/main")
    public String tradeMain() {
        return "redirect:/item/mainPaging";
    }
}
