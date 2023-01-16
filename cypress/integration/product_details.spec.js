describe("it should be able to visit the home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("Users should be able to navigate to an individual product page", () => {
    cy.get(":nth-child(1) > a > img").click();
    cy.get(".product-detail")
      .should("be.visible")
      .find("p")
      .should(($p) => {
        // https://on.cypress.io/$
        // return an array of texts from all of the p's
        const texts = $p.map((i, el) => Cypress.$(el).text());
        // jquery map returns jquery object
        // and .get() convert this to simple array
        const paragraphs = texts.get();

        expect(paragraphs, "has 1 paragraph").to.have.length(1);

        expect(
          paragraphs.join().replace(/\n/g, "").trim(),
          "has expected text in each paragraph"
        ).to.deep.eq(
          "The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks."
        );
      });
  });
});
