package com.mamalimomen.services.impl;

import org.junit.jupiter.api.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.concurrent.TimeUnit;

@Tag("service")
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class PostServiceImplTest {
    static EntityManagerFactory emf;
    PostService ps;
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
        ps = new PostServiceImpl(em);
    }

    @AfterEach
    void afterEach() {
        ps.closeEntityManger();
        ps = null;
    }

    @Test
    @Order(1)
    @DisplayName("Create new Post")
    @Timeout(value = 500, unit = TimeUnit.MILLISECONDS)
    void createNewPostTest() {
    }

    @Test
    @Order(2)
    @DisplayName("Retrieve all exist Posts order by Like")
    @Timeout(value = 500, unit = TimeUnit.MILLISECONDS)
    void retrieveAllExistPostsOrderByLikeTest() {
    }

    @Test
    @Order(3)
    @DisplayName("Update exist Post")
    @Timeout(value = 500, unit = TimeUnit.MILLISECONDS)
    void updateExistPostTest() {
    }

    @Test
    @Order(4)
    @DisplayName("Add exist Post a Like")
    @Timeout(value = 500, unit = TimeUnit.MILLISECONDS)
    void addExistPostALikeTest() {
    }

    @Test
    @Order(5)
    @DisplayName("Add exist Post a Comment")
    @Timeout(value = 500, unit = TimeUnit.MILLISECONDS)
    void addExistPostACommentTest() {
    }
}
