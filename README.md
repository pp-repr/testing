# Filmweb Testing Project

This project includes automated tests for Filmweb, a Polish movie database site, using both **pytest** and **Robot Framework**. The structure is modular and reusable, with page objects, helper functions, and custom keywords split into dedicated folders.

## Features

- **Page Object Model (POM)**: Centralizes UI interactions in classes like `LoginPage.py` and `SearchPage.py`.
- **Custom Keywords**: `.resource` files for Robot Framework enhance readability and reusability of test steps.
- **Dual Framework Support**: 
  - **Robot Framework** tests: `tests-robot`
  - **pytest** tests: `tests-pytest`

## Project Structure

**filmweb-testing/**  
├── **lib/**  
│   ├── `config.py`             — common constants used in tests  
│   ├── `cookies.json`          — file where cookies are saving  
│   ├── `enums.py`              — enum class  
│   └── `utilities.py`          — helpers functions  
├── **pages/**  
│   ├── `BasePage.py`           — class with common page interactions  
│   ├── `LoginPage.py`          — class for login page interactions  
│   ├── `MoviePage.py`          — class for login page interactions  
│   ├── `RankingPage.py`        — class for login page interactions  
│   └── `SearchPage.py`         — class for search page interactions  
├── **resources/**  
│   ├── `login_keyword.resource`  
│   ├── `movie_keyword.resource`  
│   ├── `ranking_keyword.resource`  
│   └── `search_keyword.resource`  
├── **tests-robot/**  
│   ├── **results/**            — directory with test results  
│   ├── `test_login.robot`      — login-related tests written in Robot Framework  
│   ├── `test_movie.robot`      — movie-related tests written in Robot Framework  
│   ├── `test_ranking.robot`    — ranking-related tests written in Robot Framework  
│   └── `test_search.robot`     — search-related tests written in Robot Framework  
├── **tests-pytest/**  
│   ├── `test_login.py`         — login-related tests written in pytest  
│   ├── `test_movie.py`         — movie-related tests written in pytest  
│   ├── `test_ranking.py`       — ranking-related tests written in pytest  
│   └── `test_search.py`        — search-related tests written in pytest  
├── `conftest.py`               — pytest fixtures  
├── `pytest.ini`                — pytest configuration file  
├── `.venv`  
└── `requirements.txt`  

## Prerequisites

Before running the tests, make sure to have the following installed:
- **Python 3.x**
- **pip** (Python package installer)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/testing.git
    cd filmweb-testing
    ```

2. Set up a virtual environment:

    ```bash
    python -m venv .venv
    ```

3. Activate the virtual environment:
   - On **Windows**:
     ```bash
     .venv\Scripts\activate
     ```
   - On **Linux/macOS**:
     ```bash
     source .venv/bin/activate
     ```

4. Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

## Running Tests

You can run the tests using either **pytest** or **Robot Framework**, depending on your preference.

### 1. Running Pytest Tests

To run tests written in pytest, simply use the following command:

```bash
pytest
```
This will run all .py test files in the tests-pytest directory.

### 2. Running Robot Framework Tests

To run tests written in **Robot Framework** execute:

```bash
robot --outputdir .\tests-robot\results .\tests-robot
```

or

```bash
python -m robot --outputdir .\tests-robot\results .\tests-robot
```

This will run all .robot files in the tests-robot directory.

### 3. Running Specific Tests

- **Pytest**: To run a specific test:

```bash
pytest -k "test_rate_movie"
```

- **Robot Framework**: To run a specific test use **Tags**:
```bash
robot --outputdir .\tests-robot\results -i RANKING .\tests-robot
```

## Configuration
- **pytest.ini**: The configuration file for pytest, where you can define settings like test markers, log formatting, and more.
- **conftest.py**: A file where you can define shared fixtures, hooks, and other pytest-related configurations.
