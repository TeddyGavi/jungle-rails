describe("it should be able to visit the home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });
  // visit home page
  // click add to cart on a product
  // confirm that cart total increases by 1
  it("Should increase the cart total by 1", () => {
    cy.get(".end-0").should("contain", "My Cart (0)");
    cy.get("#data-testid-add-cart-2").click({ force: true });
    cy.get(".end-0").should("contain", "My Cart (1)");
  });

  it("Should increase the cart total by 1, from product page", () => {
    cy.get(".end-0").should("contain", "My Cart (0)");
    cy.get(":nth-child(1) > a > img").click();
    cy.get(".product-detail").should("be.visible");
    cy.get("#data-testid-add-cart-2").click({ force: true });
    cy.get(".end-0").should("contain", "My Cart (1)");
  });

  it("should decrease the cart total by 1 when the reduce by one button is clicked", () => {
    cy.get(".end-0").should("contain", "My Cart (0)");
    cy.get("#data-testid-add-cart-2").click({ force: true });
    cy.get(".end-0").should("contain", "My Cart (1)");
    cy.get(".end-0 > a").click();
    cy.get(".cart-show").should("contain", "Pay with Card");
    cy.get('[action="/cart/remove_item?product_id=2"] > .btn').click();
    cy.get(".end-0").should("contain", "My Cart (0)");
    cy.get(".cart-show").should("not.contain", "Pay with Card");
  });
});
