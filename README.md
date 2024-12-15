# 🏄🌊 SurfBnB (surfboards and barrells )

Platform to rent surfboards from users instead of buying a new one to emphasize reutilization and reduce the carbon footprint of making a new board.

## Introduction

This is just a pet-project to practice and introduce these practices and techniques:

- Model the domain using Domain Driven Design.
- Use Hexagonal Architecture to decouple layers from each other.
- Decouple bussiness behavior using CQRS.
- Vertical slicing of the increments.
- Test Driven Develompent.
- Trunk Based Development.
- Continuous integration and deployment.

### Disclaimer

Please, take into consideration that this project's single goal is just practice and I would do it in pair-programming if could 😔. Thus, it's main focus will be on using the techniques listed above. Some would probably delay putting the prototype in production and increase it's complexity, so validating and receiving feedback from the user would be too late.

As I strongly believe that **code is just liability and just a means to an end, which is to deliver value to the user**, in real world scenario I would be more pragmatic and with a product mindset the approach I would take would be more lean and the first prototype would be much simpler to put the app available for all the users, just to iterate it in many small steps.

## Bussiness case

Sufbnb aims to reduce the carbon footprint originated from the fabrication of surfboards by giving surfers a platform to rent different type of surfboards directly from other surfers.

For the Minimum Marketable Product (MMP) we want the following features:

- Anyone can join the surfbnb community, which users are known as _surfbnbers_.

  - The required data will be name, surname, email and password. All mandatory.
  - When loging in she will use her mail and password. Password has to have at least 8 characters and combine letters and numbers.
  - Don't worry for lost passwords or recovering option. Login logic will be simple for now but we aim to integrate with a SaS in the long-term (possibly Auth0). Not mandatory for the MMP.

- A _surfbnber_ will be able search for boards in the app. Boards can be searched for lenght, volume in liters or fin configuration.

  - The search won't discriminate the available and already rented ones just to show the user how big is the catalogue we have.

- A _surfbnber_ will be able introduce a board to the system and set it as available or unavailable/unrentable depending on its will.

- A _surfbnber_ will be able see the historic of the rentals she has made.

- A board will only be rented when it's available. The owner of the board won't be able to set it as unavailable/unrentable untill the current renting has finished.

- For now, a surfboard rent will be an hour long with a fixed price of 10€.
