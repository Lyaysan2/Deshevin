package ru.itis.deshevin.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.deshevin.dto.DrugDto;
import ru.itis.deshevin.security.details.UserEntityDetails;
import ru.itis.deshevin.services.DrugService;
import ru.itis.deshevin.services.SearchService;
import ru.itis.deshevin.services.UserService;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/search")
@RequiredArgsConstructor
public class SearchController {

    private final SearchService searchService;
    private final DrugService drugService;
    private final UserService userService;

    @GetMapping
    public String getAnalogueClassPage(@AuthenticationPrincipal UserEntityDetails userEntityDetails, Model model,
                                       @RequestParam Optional<String> prefixParam) {
        String prefix = prefixParam.orElse("");
        System.err.println("prefix: " + prefix);
        model.addAttribute("user", userService.getUserByAuth(userEntityDetails).orElse(null));
        model.addAttribute("drugs", drugService.getAllDrugs(prefix));
        return "search-drug";
    }

//    @GetMapping("/prefix/{prefix}")
//    @ResponseBody
//    public List<DrugDto> findAllDrugsByPrefix(@PathVariable String prefix) {
//        return searchService.getDrugsByNameStartsWith(prefix);
//    }

    @GetMapping("/analogue/{id}")
    public String getAnalogueClassPage(@AuthenticationPrincipal UserEntityDetails userEntityDetails,
                                       @PathVariable UUID id,
                                       Model model) {
        model.addAttribute("user", userEntityDetails == null ? null : userEntityDetails.getUserEntity());
        model.addAttribute("drugs", searchService.getDrugsWithSameAnalogueClassAs(id));
        return "analogue-drugs";
    }

//    @GetMapping("/category/{id}")
//    public String getCategoryPage(@AuthenticationPrincipal UserEntityDetails userEntityDetails,
//                                  @PathVariable UUID id,
//                                  Model model) {
//        model.addAttribute("user", userEntityDetails == null ? null : userEntityDetails.getUserEntity());
//        model.addAttribute("drugs", searchService.getDrugsWithSameCategoryAs(id));
//        return "analogue-drugs";
//    }

}
