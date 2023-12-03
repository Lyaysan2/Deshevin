package ru.itis.deshevin.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.deshevin.security.details.UserEntityDetails;

@Slf4j
@Controller
public class HomeController {

    @GetMapping("/homepage")
    public String getHomePage(@AuthenticationPrincipal UserEntityDetails userEntityDetails, Model model) {
        model.addAttribute("user", userEntityDetails == null ? null : userEntityDetails.getUserEntity());
        return "home";
    }

    @GetMapping("/")
    public String redirectHomePage() {
        return "redirect:/homepage";
    }

}