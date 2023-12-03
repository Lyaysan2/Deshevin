package ru.itis.deshevin.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.itis.deshevin.dto.DrugDto;
import ru.itis.deshevin.security.details.UserEntityDetails;
import ru.itis.deshevin.services.SearchService;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/search")
@RequiredArgsConstructor
public class SearchController {

    private final SearchService searchService;

    @GetMapping
    public String getAnalogueClassPage(@AuthenticationPrincipal UserEntityDetails userEntityDetails, Model model) {
        model.addAttribute("user", searchService.getUserByAuth(userEntityDetails).orElse(null));
        model.addAttribute("drugs", searchService.getDrugsForPreview());
        return "search-drug";
    }

    @GetMapping("/prefix/{prefix}")
    @ResponseBody
    public List<DrugDto> findAllDrugsByPrefix(@PathVariable String prefix) {
        return searchService.getDrugsByNameStartsWith(prefix);
    }

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
