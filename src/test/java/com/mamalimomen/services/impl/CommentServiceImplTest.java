package com.mamalimomen.services.impl;

import org.junit.jupiter.api.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.concurrent.TimeUnit;

@Tag("service")
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class CommentServiceImplTest {
    static EntityManagerFactory emf;
    CommentService cs;
    EntityManager em;

    @BeforeAll
    static void beforeAll() {
        emf = Persistence.createEntityManagerFactory("persistence-unit-one");
    }

    @AfterAll
    static void afterAll() {
        emf.close();
    }

    @BeforeEach
    void beforeEach() {
        em = emf.createEntityManager();
        cs = new CommentServiceImpl(em);
    }

    @AfterEach
    void afterEach() {
        cs.closeEntityManger();
        cs = null;
    }

    @Test
    @Order(1)
    @DisplayName("Create new Comment")
    @Timeout(value = 500, unit = TimeUnit.MILLISECONDS)
    void createNewCommentTest() {
    }
}
