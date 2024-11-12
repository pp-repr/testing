import pytest

from pages.LoginPage import LoginPage
from lib.config import *
from lib.utilities import create_driver


@pytest.fixture(scope="function")
def driver():
    driver = create_driver()
    yield driver
    driver.quit()


@pytest.fixture(scope="function")
def auth_driver():
    driver = create_driver()
    page = LoginPage(driver)
    page.add_cookies_to_driver(COOKIES_FILE)
    page.get_url(BASE_URL)
    yield driver
    page.save_cookies(COOKIES_FILE)
    driver.quit()
