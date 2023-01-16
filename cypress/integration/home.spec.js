// <reference types="cypress" />

describe("it should be able to visit the home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");

    it("Should show products on the page", () => {
      cy.get(".products article").should("be.visible");
    });
  });
});
