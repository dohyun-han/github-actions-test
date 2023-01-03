package com.example.actions.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class DemoController {
    private final DemoRepository demoRepository;

    @PostMapping
    public ResponseEntity save(){
        Demo demo = Demo.builder().name("test").build();
        Demo save = demoRepository.save(demo);
        return ResponseEntity.ok().body(save);
    }

    @GetMapping
    public ResponseEntity find(){
        List<Demo> list = demoRepository.findAll();
        return ResponseEntity.ok().body(list);
    }
}
