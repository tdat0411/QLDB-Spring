package com.example.QLDB.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.QLDB.domain.Contact;
import com.example.QLDB.repository.ContactRepository;

@Service
public class ContactService {
    private final ContactRepository contactRepository;

    public ContactService(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public Page<Contact> getAllContacts(Pageable page) {
        return this.contactRepository.findAll(page);
    }

    public Optional<Contact> getContactById(Long id) {
        return this.contactRepository.findById(id);
    }

    public Contact saveContact(Contact contact) {
        return this.contactRepository.save(contact);
    }

    public void deleteContact(Long id) {
        this.contactRepository.deleteById(id);
    }

    public void editContact(Contact contact) {
        Optional<Contact> contactOptional = this.getContactById(contact.getId());
        if (contactOptional.isPresent()) {
            Contact curreContact = contactOptional.get();
            curreContact.setName(contact.getName());
            curreContact.setPhone(contact.getPhone());
            curreContact.setEmail(contact.getEmail());
            this.contactRepository.save(curreContact);
        }
    }
}
