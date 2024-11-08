import pytest

from pages.LoginPage import LoginPage
from lib.config import *
from lib.enums import LoginMethod


@pytest.mark.order(1)
class TestLogin:

    @pytest.fixture(autouse=True)
    def setup_method(self, driver):
        self.login_page = LoginPage(driver)
        self.login_page.get_url(BASE_URL)
        self.login_page.reject_cookies()
        self.login_page.skip_advertising()
        self.login_page.click_login_button()

    def test_valid_login(self):
        self.login_page.choose_login_method(LoginMethod.FILMWEB)
        self.login_page.enter_username(EMAIL)
        self.login_page.enter_password(PASSWORD)
        self.login_page.submit_login_data()
        self.login_page.save_cookies(COOKIES_FILE)
        assert self.login_page.find_avatar() is not None, "Avatar not found, you are not log in"
        assert self.login_page.read_cookies(COOKIES_FILE), "File not found or empty"

    def test_invalid_login(self):
        self.login_page.choose_login_method(LoginMethod.FILMWEB)
        self.login_page.enter_username(INVALID_EMAIL)
        self.login_page.enter_password(INVALID_PASSWORD)
        self.login_page.submit_login_data()
        error_message = self.login_page.get_error_message()
        assert "Nieprawidłowy login lub hasło!" in error_message, "Expected error message not found for incorrect credentials."


@pytest.mark.order(2)
class TestLoginCookies:

    def test_login_with_cookies(self, driver):
        self.login_page = LoginPage(driver)
        self.login_page.add_cookies_to_driver(COOKIES_FILE)
        self.login_page.get_url(BASE_URL)
        assert self.login_page.find_avatar() is not None, "Avatar not found, you are not log in"
