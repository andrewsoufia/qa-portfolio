# QA Portfolio – Andrew Soufia

Junior QA Engineer focused on manual and automation testing of web apps and APIs.
This repo holds my manual testing work: test design, test cases, bug reports, traceability, SQL data validation and API tests.
My automation code (Selenium, Playwright, PyTest, API tests in Python) is in **[qa-automation](https://github.com/andrewsoufia/qa-automation)**.

## Projects

| Folder                                                         | What it shows                                                                                                                                                         |
| -------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [01 - QA-Fundamentals](01%20-%20QA-Fundamentals/)              | Core testing concepts, plus test design for a signup form: equivalence partitioning, boundary value analysis and a decision table (16 rules collapsed to 5)           |
| [02 - Manual-Testing](02%20-%20Manual-Testing/)                | Manual testing of [SauceDemo](https://www.saucedemo.com) with 3 user accounts: test cases, bug reports with DevTools evidence, and a requirements traceability matrix |
| [03 - SQL](03%20-%20SQL/)                                      | 15 SQL queries on a shop database: reporting queries plus data validation queries that find planted data defects                                                      |
| [04 - API-Postman](04%20-%20API-Postman/)                      | Postman collection for the [Restful-Booker API](https://restful-booker.herokuapp.com): positive and negative tests, auth token, chained requests                      |
| [qa-automation](https://github.com/andrewsoufia/qa-automation) | Selenium + PyTest with the Page Object Model, Playwright, API tests with `requests`, fixtures, parametrize, HTML reports                                              |

## Highlights

- **26 test cases** covering login, sorting, product images and details, cart and checkout, each run on standard_user, problem_user and error_user
- **21 bug reports** with steps, expected vs actual, severity, priority and evidence from the Console, Network and Application (local storage) tabs
- **Traceability matrix** linking 9 requirements to all 26 test cases and their bugs
- **15 SQL queries**, 8 of them data validation checks that each found a defect: missing, duplicate and invalid emails, negative prices and stock, orphan orders, an invalid status, future dates and wrong order totals
- **22 Postman requests** with automated test scripts: status codes, response body checks, response times and a token saved to the environment and reused by later requests

## Known failing Postman tests

7 of the 36 tests fail on purpose. The API does not behave as it should, and each failure documents a real API defect:

| Request                              | Expected                                               | Actual                                           |
| ------------------------------------ | ------------------------------------------------------ | ------------------------------------------------ |
| post auth with wrong password        | 401 Unauthorized                                       | 200 OK with `{"reason": "Bad credentials"}`      |
| post empty firstname                 | 400 Bad Request                                        | 200 OK, booking created with an empty first name |
| post booking missing lastname        | 400 Bad Request                                        | 500 Internal Server Error                        |
| post booking totalprice as text      | 400 Bad Request                                        | 200 OK, booking created                          |
| post booking checkout before checkin | 400 Bad Request                                        | 200 OK, booking created                          |
| get bookings having checkin query    | The new booking (checkin 2025-01-01) is in the results | The booking is missing from the results          |
| delete booking id with token         | 200 OK or 204 No Content                               | 201 Created                                      |

## How to use these files

- **PDFs:** click any PDF in `01` or `02` to view it on GitHub.
- **SQL:** open [sqliteonline.com](https://sqliteonline.com) (SQLite), paste and run `shop-practice-db.sql`, then run the queries from `shop-sql-queries.sql`. The tasks are in `sql-tasks.md`.
- **Postman:** import both JSON files from `04 - API-Postman`, select the "Restful-Booker Tests Environment", and run the collection.

## Tools

Python · PyTest · Selenium · Playwright · Postman · SQL (SQLite) · Git and GitHub · Chrome DevTools · Java and JUnit 5 (basics)

## Contact

- LinkedIn: https://www.linkedin.com/in/andrew-soufia/
