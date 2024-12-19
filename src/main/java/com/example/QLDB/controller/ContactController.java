package com.example.QLDB.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.QLDB.domain.Contact;
import com.example.QLDB.service.ContactService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ContactController {
    private final ContactService contactService;

    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @RequestMapping("/contacts")
    public String getContactHome(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        Pageable pageable = PageRequest.of(page - 1, 1);
        Page<Contact> cts = contactService.getAllContacts(pageable);
        List<Contact> listContacts = cts.getContent();
        model.addAttribute("contacts", listContacts);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", cts.getTotalPages());
        return "contacts";
    }

    @GetMapping("/add")
    public String getAddContactHome(Model model) {
        model.addAttribute("newContact", new Contact());
        return "add-contact";
    }

    @PostMapping("/add")
    public String postAddContactHome(Model model, @ModelAttribute("newContact") Contact contact) {
        this.contactService.saveContact(contact);
        return "redirect:/contacts";
    }

    @GetMapping("/edit/{id}")
    public String getEditContactHome(@PathVariable long id, Model model) {
        Optional<Contact> contact = this.contactService.getContactById(id);
        model.addAttribute("newContact", contact);
        return "edit-contact";
    }

    @PostMapping("/edit")
    public String postEditContactHome(Model model, @ModelAttribute("newContact") Contact contact) {
        this.contactService.editContact(contact);
        return "redirect:/contacts";
    }

    @GetMapping("/delete/{id}")
    public String getDeleteContact(Model model, @PathVariable long id) {
        this.contactService.deleteContact(id);
        return "redirect:/contacts";
    }

}
