# Team Expense Manager

A Spring Boot REST API for tracking shared expenses within a team. Create **users**, group them into **events** (a trip, an offsite, a team dinner), and record **expenses** against each event along with who paid.

> Built with Java 21, Spring Boot, Spring Data JPA and MySQL, with interactive API docs via Swagger UI.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Data Model](#data-model)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [API Reference](#api-reference)
- [Request Examples](#request-examples)
- [Validation & Error Handling](#validation--error-handling)
- [Roadmap](#roadmap)
- [Author](#author)

---

## Features

- **User management**: create, list, fetch and delete users (unique email enforced).
- **Event management**: create events with a name and location, add or remove members, delete events.
- **Expense tracking**: record expenses with description, amount, category and date, linked to an event and the user who paid.
- **Per-event expense lookup**: fetch all expenses for a given event.
- **Input validation**: Bean Validation on all request bodies.
- **Centralized error handling**: consistent JSON error responses through a global exception handler.
- **Swagger UI**: browse and try every endpoint from the browser.
- **Actuator**: Spring Boot Actuator included for health and metrics.

## Tech Stack

| Layer            | Technology                                   |
| ---------------- | -------------------------------------------- |
| Language         | Java 21                                      |
| Framework        | Spring Boot 4.1.1 (Web MVC)                  |
| Persistence      | Spring Data JPA / Hibernate                  |
| Database         | MySQL                                        |
| Validation       | Jakarta Bean Validation                      |
| API Docs         | springdoc-openapi 3.1.0 (Swagger UI)         |
| Boilerplate      | Lombok                                       |
| Build tool       | Maven (with Maven Wrapper)                   |

## Project Structure

```
Team_Expence_Manager
├── pom.xml
├── mvnw / mvnw.cmd
└── src
    ├── main
    │   ├── java/com/vikram/Team_expence_Manager
    │   │   ├── TeamExpenceManagerApplication.java   # Entry point
    │   │   ├── Controller/    # REST controllers (User, Event, Expense)
    │   │   ├── Service/       # Service interfaces
    │   │   ├── ServiceImpl/   # Business logic
    │   │   ├── Repository/    # Spring Data JPA repositories
    │   │   ├── Entity/        # JPA entities (User, Event, Expense)
    │   │   ├── Dto/           # Request records with validation rules
    │   │   └── Exceptions/    # Custom exceptions + global handler
    │   └── resources
    │       └── application.yaml
    └── test
        └── java/.../TeamExpenceManagerApplicationTests.java
```

## Data Model

```
User ──< event_members >── Event ──< Expense >── User (paidBy)
```

| Entity      | Fields                                                              |
| ----------- | ------------------------------------------------------------------- |
| **User**    | `id`, `name`, `email` (unique)                                      |
| **Event**   | `id`, `eventName`, `location`, `members`, `expenses`                |
| **Expense** | `id`, `description`, `amount`, `category`, `expenseDate`, `event`, `paidBy` |

- `User` and `Event` have a many-to-many relationship through the `event_members` join table.
- Each `Expense` belongs to exactly one `Event` and is paid by exactly one `User`.
- Deleting an `Event` cascades to its expenses.

## Getting Started

### Prerequisites

- JDK 21
- MySQL 8+ running locally
- Maven (or use the included wrapper)

### 1. Clone the repository

```bash
git clone https://github.com/VikramKumar-java/Team_Expence_Manager.git
cd Team_Expence_Manager
```

### 2. Create the database

```sql
CREATE DATABASE vikramdb;
```

Tables are created automatically on startup (`ddl-auto: update`).

### 3. Configure credentials

Edit `src/main/resources/application.yaml` and set your MySQL username and password (see [Configuration](#configuration)).

### 4. Run the application

```bash
# Linux / macOS
chmod +x mvnw
./mvnw spring-boot:run

# Windows
mvnw.cmd spring-boot:run
```

The API starts on **http://localhost:9977**.

### 5. Open the API docs

- Swagger UI: http://localhost:9977/swagger-ui.html
- OpenAPI JSON: http://localhost:9977/v3/api-docs

## Configuration

Default settings in `src/main/resources/application.yaml`:

| Property                          | Default value                        |
| --------------------------------- | ------------------------------------ |
| `server.port`                     | `9977`                               |
| `spring.datasource.url`           | `jdbc:mysql://localhost:3306/vikramdb` |
| `spring.datasource.username`      | `root`                               |
| `spring.datasource.password`      | `root`                               |
| `spring.jpa.hibernate.ddl-auto`   | `update`                             |
| `spring.jpa.show-sql`             | `true`                               |

> **Tip:** Don't commit real credentials. Override them with environment variables instead, for example `SPRING_DATASOURCE_USERNAME` and `SPRING_DATASOURCE_PASSWORD`.

## API Reference

### Users: base path `/api/v1`

| Method | Endpoint                     | Description          |
| ------ | ---------------------------- | -------------------- |
| POST   | `/api/v1/creatingUser`       | Create a user        |
| GET    | `/api/v1/getusers`           | List all users       |
| GET    | `/api/v1/userById/{id}`      | Get a user by ID     |
| DELETE | `/api/v1/deleteuserByID/{id}`| Delete a user        |

### Events: base path `/api/events`

| Method | Endpoint                                  | Description                |
| ------ | ----------------------------------------- | -------------------------- |
| POST   | `/api/events/createEvent`                 | Create an event            |
| GET    | `/api/events/getAllEvents`                | List all events            |
| GET    | `/api/events/getEventById/{id}`           | Get an event by ID         |
| GET    | `/api/events/{eventId}/members/{userId}`  | Add a user to an event     |
| DELETE | `/api/events/{eventId}/removeMember/{userId}` | Remove a user from an event |
| DELETE | `/api/events/deleteEvent/{id}`            | Delete an event            |

### Expenses: base path `/api/v1`

| Method | Endpoint                  | Description                    |
| ------ | ------------------------- | ------------------------------ |
| POST   | `/api/v1`                 | Create an expense              |
| GET    | `/api/v1`                 | List all expenses              |
| GET    | `/api/v1/{id}`            | Get an expense by ID           |
| GET    | `/api/v1/event/{eventId}` | List expenses for an event     |
| PUT    | `/api/v1/{id}`            | Update an expense              |
| DELETE | `/api/v1/{id}`            | Delete an expense              |

## Request Examples

**Create a user**

```http
POST /api/v1/creatingUser
Content-Type: application/json

{
  "name": "Vikram",
  "email": "vikram@example.com"
}
```

**Create an event**

```http
POST /api/events/createEvent
Content-Type: application/json

{
  "eventName": "Goa Team Trip",
  "location": "Goa"
}
```

**Add a member to an event**

```http
GET /api/events/1/members/1
```

**Create an expense**

```http
POST /api/v1
Content-Type: application/json

{
  "description": "Dinner at beach shack",
  "amount": 2450.50,
  "category": "Food",
  "expenseDate": "2026-10-18",
  "eventId": 1,
  "userId": 1
}
```

## Validation & Error Handling

Request bodies are validated with Jakarta Bean Validation:

| Request        | Rules                                                                 |
| -------------- | --------------------------------------------------------------------- |
| `UserRequest`  | `name` required, `email` required and well-formed                     |
| `EventRequest` | `eventName` and `location` required                                   |
| `ExpenseRequest` | `description`, `category` required; `amount` required and > 0; `expenseDate`, `eventId`, `userId` required |

Errors are returned as JSON:

```json
{
  "timetamp": "2026-10-20T13:07:00",
  "status": 404,
  "error": "Not Found",
  "message": "Event with ID 99 not found",
  "path": "/api/events/getEventById/99"
}
```

## Roadmap

- Expense splitting and per-member balances ("who owes whom")
- Per-event totals and category-wise summaries
- Authentication and authorization (Spring Security / JWT)
- Move credentials to environment variables or profiles
- Use DTO responses instead of exposing entities directly
- Docker Compose setup (app + MySQL)
- Unit and integration tests for services and controllers

## Author

**Vikram Kumar**
GitHub: [@VikramKumar-java](https://github.com/VikramKumar-java)
