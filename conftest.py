import pytest

from pages.BasePage import BasePage
from lib.config import *
from lib.helpers import create_driver


@pytest.fixture(scope="function")
def driver():
    driver = create_driver()
    yield driver
    driver.quit()


@pytest.fixture(scope="function")
def auth_driver():
    driver = create_driver()
    base_page = BasePage(driver)
    base_page.add_cookies_to_driver(COOKIES_FILE)
    base_page.get_url(BASE_URL)
    yield driver
    driver.quit()
