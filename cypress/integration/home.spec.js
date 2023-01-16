// <reference types="cypress" />

describe("it should be able to visit the home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("Should show products on the home page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
