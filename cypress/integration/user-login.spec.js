describe("Users should be able to login, and logout and register", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
    cy.request("/cypress_rails_reset_state");
    cy.clearCookies();
  });

  it("Should login a already registered user", () => {
    cy.getCookies().should("be.empty");
    cy.get('[href="/login"]').click({ force: true });
    cy.get(".new-user-session").should("be.visible");
    cy.get("#login_e_mail").type("bob@gmail.com");
    cy.get("#login_password").type("1234");
    cy.get("#data-testid-login").click();
    cy.get("li.nav-link").should("contain", "Signed in as bob@gmail.com");
    cy.getCookies()
      .should("have.length", 1)
      .should((cookies) => {
        expect(cookies[0]).to.have.property("name", "_new_session");
      });
  });

  it("should be able to logout a registered user", () => {
    // using cookies this way is secure?
    cy.getCookies().should("be.empty");
    cy.get('[href="/login"]').click({ force: true });
    cy.get(".new-user-session").should("be.visible");
    cy.get("#login_e_mail").type("bob@gmail.com");
    cy.get("#login_password").type("1234");
    cy.get("#data-testid-login").click();
    cy.get("li.nav-link").should("contain", "Signed in as bob@gmail.com");
    cy.getCookies()
      .should("have.length", 1)
      .should((cookies) => {
        expect(cookies[0]).to.have.property("name", "_new_session");
      });
    // logout
    cy.get("li.nav-link > .text-danger").click();
    cy.get("li.nav-link").should("not.contain", "Signed in as bob@gmail.com");
    cy.get("li.nav-link").contains("Login | Signup");
    cy.getCookies()
      .should("have.length", 1)
      .should((cookies) =>
        expect(cookies[0]).to.have.property("name", "_new_session")
      );
  });

  it("Should be able to register a user, and automatically login", () => {
    // need to destroy the user by email here first, so the tests can automatically run
    cy.getCookies().should("be.empty");
    cy.get('[href="/signup"]').should("be.visible");
    cy.get('[href="/signup"]').click({ force: true });
    cy.get(".new-user").should("be.visible");
    cy.get("#user_first_name").type("test");
    cy.get("#user_last_name").type("hello");
    cy.get("#user_e_mail").type("test@example.com");
    cy.get("#user_password").type("0123");
    cy.get("#user_password_confirmation").type("0123");
    cy.get("#data-testid-signup").click();
    cy.get("li.nav-link").should("contain", "Signed in as test@example.com");
    cy.get(".alert").contains("Successfully created user.");
    cy.getCookies()
      .should("have.length", 1)
      .should((cookies) => {
        expect(cookies[0]).to.have.property("name", "_new_session");
      });
  });
});
